{
  lib,
  config,
  ...
}:

let
  inherit (lib) mkEnableOption mkIf;

  cfg = config.module."<name>";
in
{
  options.module = {
    enable = mkEnableOption "Enable module";
  };

  config = mkIf cfg.enable {
  };
}
