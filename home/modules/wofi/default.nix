{
  lib,
  config,
  ...
}:

let
  inherit (lib) mkEnableOption mkIf;

  cfg = config.module.wofi;
in
{
  options = {
    module.wofi = {
      enable = mkEnableOption "Enable wofi app runner";
    };
  };

  config = mkIf cfg.enable {
    programs.wofi = {
      enable = true;

      settings = {
        allow_images = true;
        insensitive = true;
        normal_window = true;
        layer = "top";
        key_expand = "Tab";
        width = "30%";
      };
    };
  };
}
