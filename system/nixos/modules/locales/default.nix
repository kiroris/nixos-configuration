{
  lib,
  config,
  ...
}:

let
  inherit (lib) mkEnableOption mkIf;

  cfg = config.module.locales;
in
{
  options = {
    module.locales.enable = mkEnableOption "Enable module locales";
  };

  config = mkIf cfg.enable {
    # Locale settings
    i18n = {
      defaultLocale = "en_US.UTF-8";
      supportedLocales = [ "all" ];
    };
  };
}
