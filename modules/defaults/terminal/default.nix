{
  lib,
  config,
  pkgs,
  ...
}:

let
  inherit (lib) mkOption;
  inherit (lib.types) enum str;

  cfg = config.module.defaults;
in
{
  options.module.defaults = {
    # Defaults
    terminal = mkOption {
      type = enum [
        "foot"
        "foot-client"
        "wezterm"
      ];

      default = "foot-client";
    };

    # Defaults cmds
    terminalCmd =
      let
        terminalExecs = {
          foot = "${pkgs.foot}/bin/foot";
          foot-client = "${pkgs.foot}/bin/footclient";
          wezterm = "${pkgs.wezterm}/bin/wezterm-gui";
        };
      in
      mkOption {
        type = str;
        default = terminalExecs.${cfg.terminal};
      };
  };
}
