{
  lib,
  config,
  ...
}:

let
  inherit (lib) mkEnableOption mkIf;

  cfg = config.module.programs.dconf;
in
{
  options = {
    module.programs.dconf.enable = mkEnableOption "Enabl dconf";
  };

  config = mkIf cfg.enable {
    programs.dconf.enable = true;
  };
}
