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

        ignore-empty-password = true;

        clock = true;
        timestr = "%R";
        datestr = "%a, %e of %B";
        fade-in = 0.5;

        effect-blur = "15x2";

        no-unlock-indicator = true;
        hide-keyboard-layout = true;

        indicator = true;
        indicator-radius = 210;
        indicator-thickness = 20;
        indicator-caps-lock = true;

        color = mkDefault "282828";
        daemonize = true;
        line-uses-ring = true;
        show-failed-attempts = true;
      };
    };
  };
}
