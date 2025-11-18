_:

{
  services = {
    # discard blocks that are not in use by the filesystem, good for SSDs health
    fstrim = {
      enable = true;
      interval = "weekly";
    };
  };

  fileSystems = {
    "/" = {
      fsType = "xfs";
      options = [
        "defaults"
        "noatime"
      ];
    };
  };

  disko.devices = {
    disk = {
      main = {
        device = "/dev/disk/by-id/ata-Samsung_SSD_870_EVO_500GB_S6PYNM0T604172Z";
        type = "disk";
        content = {
          type = "gpt";
          partitions = {
            ESP = {
              type = "EF00";
              size = "1G";
              content = {
                type = "filesystem";
                format = "vfat";
                mountpoint = "/boot";
                mountOptions = [ "umask=0077" ];
              };
            };
            root = {
              size = "100%";
              content = {
                type = "filesystem";
                format = "xfs";
                mountpoint = "/";
                mountOptions = [ "noatime" ];
              };
            };
          };
        };
      };
    };
  };
}
