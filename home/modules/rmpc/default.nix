{
  lib,
  config,
  ...
}:

let
  inherit (lib) mkEnableOption mkIf;

  cfg = config.module.rmpc;
in
{
  options = {
    module.rmpc.enable = mkEnableOption "Enables rmpc for MPD";
  };

  config = mkIf cfg.enable {
    programs.rmpc = {
      enable = true;

      config = ''
        {
          address: "127.0.0.1:6600",
          password: None,
          cache_dir: None,
          on_song_change: None,
          volume_step: 5,
          max_fps: 60,
          scrolloff: 0,
          wrap_navigation: false,
          enable_mouse: true,
          enable_config_hot_reload: false,
          status_update_interval_ms: 1000,
        }
      '';
    };
  };
}
