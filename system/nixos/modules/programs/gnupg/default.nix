{
  lib,
  config,
  ...
}:

let
  inherit (lib) mkEnableOption mkIf;

  cfg = config.module.programs.gnupg;
in
{
  options = {
    module.programs.gnupg.enable = mkEnableOption "Enable module GnuPG";
  };

  config = mkIf cfg.enable {
    programs.gnupg.agent = {
      enable = true;
      enableSSHSupport = true;
    };
  };
}
