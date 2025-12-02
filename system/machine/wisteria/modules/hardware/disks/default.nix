_:

{
  services.fstrim = {
    enable = true;
    interval = "weekly";
  };

  fileSystems = {
    "/boot" = {
      device = "UUID=D395-CC9B";
      fsType = "vfat";
      options = [ "umask=0077" ];
    };

    "/" = {
      device = "UUID=140b697a-5633-4e06-8e84-248afa24ce55";
      fsType = "ext4";
      options = [
        "defaults"
        "noatime"
      ];
    };
  };
}
