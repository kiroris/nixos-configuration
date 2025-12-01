{
  lib,
  config,
  ...
}:

let
  inherit (lib) mkEnableOption mkIf;

  cfg = config.module.nixos-ng;
in
{
  options = {
    module.nixos-ng = {
      enable = mkEnableOption "Enables nixos-ng";
    };
  };

  config = mkIf cfg.enable {
    boot.initrd.systemd.enable = true;

    # Remain unshaken. Grant Silence to all that stands before you. Follow the land horizon.
    # environment.memoryAllocator.provider = "mimalloc";

    # Realtime
    security.pam.loginLimits = [
      {
        domain = "@users";
        item = "rtprio";
        type = "-";
        value = 1;
      }
    ];

    services = {
      # userborn.enable     = true;
      dbus.implementation = "broker";
    };

    systemd.tmpfiles.settings."00-fuse-uring" = {
      "/sys/module/fuse/parameters/enable_uring".w = {
        argument = "1";
      };
    };

    system = {
      # Mount /etc as an overlayfs instead of generating it via a perl script.
      # WARNING: do not enable this if your not confident in your ability to fix it
      # it is a royal pain and is not worth half the effor it takes to fix it
      /*
        etc.overlay = {
          enable = true;
          mutable = false;
        };
      */
    };
  };
}
