{
  lib,
  config,
  ...
}:

let
  inherit (lib) mkEnableOption mkIf;

  cfg = config.module.programs.mtr;
in
{
  options = {
    module.programs.mtr.enable = mkEnableOption "Enable module mtr";
  };

  config = mkIf cfg.enable {
    programs.mtr.enable = true;
  };
}
