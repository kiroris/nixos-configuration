{
  inputs,
  config,
  lib,
  pkgs,
  self,
  ...
}:

let
  inherit (lib)
    mkEnableOption
    mkDefault
    mkBefore
    mkIf
    ;

  cfg = config.module.hyprland;
in
{
  imports = [
    "${self}/home/modules/hyprland/binds"
  ];

  options = {
    module.hyprland.enable = mkEnableOption "Enable Hyprland";
  };

  config = mkIf cfg.enable {
    module.hyprland = {
      binds.enable = mkDefault cfg.enable;
    };

    wayland.windowManager.hyprland = {
      enable = true;
      xwayland.enable = true;
      package = inputs.hyprland.packages.${pkgs.system}.hyprland;

      systemd = {
        enable = true;
        extraCommands = mkBefore [
          "systemctl --user stop graphical-session.target"
          "systemctl --user start hyprland-session.target"
        ];
      };

      settings = {
        env = [
          "XDG_CURRENT_DESKTOP,Hyprland"
          "XDG_SESSION_DESKTOP,Hyprland"
          "GTK_CSD,0"
          "GTK_USE_PORTAL,1"
          "QT_WAYLAND_DISABLE_WINDOWDECORATION,1"
        ];

        animations = {
          enabled = true;
          bezier = [
            "md3_decel, 0.05, 0.7, 0.1, 1"
            "workspace,0.17, 1.17, 0.3,1"
          ];

          animation = [
            "border, 1, 2, default"
            "fade, 1, 2, md3_decel"
            "windows, 1, 4, md3_decel, popin 60%"
            "workspaces, 1, 5, workspace, slidefadevert 8%"
          ];
        };

        xwayland = {
          force_zero_scaling = "true";
        };

        decoration = {
          rounding = 3;

          active_opacity = 1.0;
          inactive_opacity = 1.0;
          fullscreen_opacity = 1.0;

          blur = {
            enabled = true;
            passes = 3;
            size = 16;
          };
        };

        general = {
          gaps_in = 3;
          gaps_out = 7;
          border_size = 3;
          layout = "master";
        };

        render = {
          direct_scanout = true;
          new_render_scheduling = true;
        };

        input = {
          kb_layout = "us,ru";
          kb_options = "grp:caps_toggle";
          #kb_variant = "colemak_dh";
          repeat_delay = 300;
          repeat_rate = 60;
          accel_profile = "flat";
          sensitivity = 0.0;

          touchpad = {
            natural_scroll = true;
          };
        };

        misc = {
          disable_autoreload = false;
          disable_hyprland_logo = true;
          focus_on_activate = false;
          force_default_wallpaper = 0;
          vrr = 1;
        };
      };
    };
  };
}
