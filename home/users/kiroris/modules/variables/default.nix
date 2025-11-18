{
  lib,
  config,
  username,
  ...
}:

with lib;

let
  cfg = config.module.user.variables;
in
{
  options = {
    module.user.variables.enable = mkEnableOption "Enables user variables";
  };

  config = mkIf cfg.enable {
    home.sessionVariables = {
      QT_QPA_PLATFORMTHEME = lib.mkForce "gtk3";
      MOZ_LEGACY_PROFILES = "1";
      FLAKE = "/home/${username}/Code/nixos-configuration";
      TDESKTOP_I_KNOW_ABOUT_GTK_INCOMPATIBILITY = "1";
      # WLR_BACKEND = "vulkan";
    };
  };
}
