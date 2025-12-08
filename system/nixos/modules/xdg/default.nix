{
  lib,
  config,
  ...
}:

let
  inherit (lib) mkEnableOption mkIf;

  cfg = config.module.xdg;
in
{
  options = {
    module.xdg.enable = mkEnableOption "Enable module xdg";
  };

  config = mkIf cfg.enable {
    xdg = {
      terminal-exec = {
        enable = true;

        settings = {
          default = [
            "${config.module.defaults.terminal}.desktop"
          ];
        };
      };
    };
  };
}
