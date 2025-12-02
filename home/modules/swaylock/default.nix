{
  lib,
  config,
  ...
}:

let
  inherit (lib) mkEnableOption mkIf mkDefault;

  cfg = config.module.swaylock;
in
{
  options = {
    module.swaylock = {
      enable = mkEnableOption "Enable swaylock";
    };
  };

  config = mkIf cfg.enable {
    programs.swaylock = {
      enable = true;

      settings = {
        color = mkDefault "282828";
        daemonize = true;
        line-uses-ring = true;
        show-failed-attempts = true;
      };
    };
  };
}
