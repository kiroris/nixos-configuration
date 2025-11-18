{
  pkgs,
  ...
}:

{
  # Kernel settings
  boot = {
    kernelPackages = pkgs.linuxPackages_latest;

    extraModulePackages = [ ];

    kernelModules = [
      "kvm-intel"
      "tls"
      "tcp_bbr"
    ];

    initrd.kernelModules = [
      "i915"
    ];

    supportedFilesystems = [
      "nfs"
    ];

    kernelParams = [
      #extra performance
      "mitigations=off"
      "kernel.watchdog=0"
      # Video driver settings
      "i915.enable_fbc=1"
      "i915.fastboot=1"
    ];

    kernel.sysctl = {
      "vm.dirty_background_bytes" = 67108864;
      "vm.dirty_bytes" = 268435456;
      "vm.dirty_expire_centisecs" = 1500;
      "vm.dirty_writeback_centisecs" = 100;
      "vm.vfs_cache_pressure" = 50;
      "vm.max_map_count" = 1048576;
    };

    initrd.availableKernelModules = [
      "xhci_pci"
      "vmd"
      "usb_storage"
      "sd_mod"
    ];
  };
}
