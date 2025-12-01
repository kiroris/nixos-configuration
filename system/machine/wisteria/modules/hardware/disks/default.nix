_:

{
  services.fstrim = {
    enable = true;
    interval = "weekly";
  };

  fileSystems = {
    "/boot" = {
      device = "/dev/disk/by-id/nvme-Netac_NVMe_SSD_500GB_MAX20230613500G46830-part1";
      fsType = "vfat";
      options = [ "umask=0077" ];
    };

    "/" = {
      device = "/dev/disk/by-id/nvme-Netac_NVMe_SSD_500GB_MAX20230613500G46830-part2";
      fsType = "xfs";
      options = [
        "defaults"
        "noatime"
      ];
    };
  };
}
