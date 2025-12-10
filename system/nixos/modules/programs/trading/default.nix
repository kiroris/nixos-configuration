{
  lib,
  config,
  pkgs,
  ...
}: let
  inherit (lib) mkEnableOption mkIf;

  cfg = config.module.programs.trading;
in {
  options = {
    module.programs.trading.enable = mkEnableOption "Enables things need for trading";
  };

  config = mkIf cfg.enable {
    environment.systemPackages = with pkgs; [
      wineWow64Packages.staging
      winetricks
    ];
  };
}
