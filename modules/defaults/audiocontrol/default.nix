{
  lib,
  pkgs,
  ...
}: let
  inherit (lib) mkOption;
  inherit (lib.types) str;
in {
  options.module.defaults = {
    audioControlCmd = mkOption {
      type = str;
      default = "${pkgs.wireplumber}/bin/wpctl";
      #default = "${pkgs.pulseaudio}/bin/pactl";
    };
  };
}
