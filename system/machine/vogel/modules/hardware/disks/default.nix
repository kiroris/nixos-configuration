_:

{
  boot.zfs = {
    extraPools = [ 
      "hdds"
    ];
  };

  services = {
    # clean zfs devices
    zfs.autoScrub = { 
      enable = true;
      interval = "weekly";
    };

    zfs.autoSnapshot.enable = true;

    # zpool trim
    zfs.trim.enable = true;

    # discard blocks that are not in use by the filesystem, good for SSDs health
    fstrim = {
      enable = true;
      interval = "weekly";
    };
  };

  disko.devices = {
    disk = {
      x = {
        type = "disk";
        device = "/dev/disk/by-id/nvme-Micron_2200V_MTFDHBA512TCK__200926FF1662";
        content = {
          type = "gpt";
          partitions = {
            ESP = {
              size = "1G";
              type = "EF00";
              content = {
                type = "filesystem";
                format = "vfat";
                mountpoint = "/boot";
                mountOptions = [ "umask=0077" ];
              };
            };
            luks = {
              size = "100%";
              content = {
                type = "luks";
                name = "crypted";
                settings.allowDiscards = true;
                content = {
                  type = "filesystem";
                  format = "xfs";
                  mountpoint = "/";
                  mountOptions = [
                    "defaults"
                    "noatime"
                    "discard"
                  ];
                };
              };
            };
          };
        };
      };
    };
  };
}
