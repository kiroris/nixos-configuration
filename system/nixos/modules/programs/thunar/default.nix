{
  lib,
  config,
  pkgs,
  ...
}:

let
  inherit (lib) mkEnableOption mkIf mkForce;

  cfg = config.module.programs.thunar;
in
{
  options = {
    module.programs.thunar.enable = mkEnableOption "Enable module Thunar";
  };

  config = mkIf cfg.enable {
    programs.thunar.enable = true;
    services.tumbler.enable = true; # Thumbnail support for images

    #services.gvfs = {
    #  enable = true;
    #  package = mkForce pkgs.gnome.gvfs;
    #};

    environment.systemPackages = with pkgs; [ file-roller ];

    programs.thunar.plugins = with pkgs.xfce; [
      thunar-archive-plugin # Requires an Archive manager like file-roller, ark, etc
      thunar-volman
    ];
  };
}
