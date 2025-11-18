_:

{
  services = {
    # discard blocks that are not in use by the filesystem, good for SSDs health
    fstrim = {
      enable = true;
      interval = "weekly";
    };
  };

  #fileSystems = {
  #  "/" = {
  #    fsType = "xfs";
  #    options = [
  #      "defaults"
  #      "noatime"
  #    ];
  #  };

  #  "/media/samsung_ssd" = {
  #    fsType = "xfs";
  #    device = "/dev/disk/by-id/ata-Samsung_SSD_870_EVO_1TB_S74ZNL0X317962K-part1";
  #    options = [
  #      "defaults"
  #      "noatime"
  #    ];
  #  };
  #};

  disko.devices = {
    disk = {
      main = {
        device = "/dev/disk/by-id/nvme-Netac_NVMe_SSD_500GB_MAX20230613500G46830";
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
              size = "25%";
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
