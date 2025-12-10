{
  lib,
  config,
  ...
}:

let
  inherit (lib) mkEnableOption mkIf mkForce;

  cfg = config.module.lanzaboote;
in
{
  options = {
    module.lanzaboote.enable = mkEnableOption "Enables lanzaboote";
  };

  config = mkIf cfg.enable {
    # Bootloader settings
    boot.loader = {
      systemd-boot.enable = mkForce false;
      efi.canTouchEfiVariables = true;
    };

    boot.lanzaboote = {
      enable = true;
      pkiBundle = "/etc/secureboot";
    };
  };
}
