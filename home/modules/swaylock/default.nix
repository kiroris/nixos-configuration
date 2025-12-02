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

        #timestr = "%R";
        #datestr = "%a, %e of %B";
        #fade-in = 0.5;


        no-unlock-indicator = true;
        hide-keyboard-layout = true;

        color = mkDefault "282828";
        daemonize = true;
        line-uses-ring = true;
        show-failed-attempts = true;
      };
    };
  };
}
