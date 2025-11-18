{
  pkgs,
  ...
}:

{
  boot = {
    kernelPackages = pkgs.linuxPackages;

    kernelModules = [
      "amdgpu"
      "kvm-amd"
      "kvm-intel"
      "tls"
      "tcp_bbr"
    ];

    supportedFilesystems = [ 
      "zfs" 
    ];

    extraModulePackages = [ ];

    kernelParams = [
      "drm_kms_helper.poll=0"
    ];

    initrd = {
      availableKernelModules = [
        "xhci_pci"
        "ahci"
        "usbhid"
        "usb_storage"
        "sd_mod"
      ];

      kernelModules = [
        "amdgpu"
      ];
    };
  };
}
