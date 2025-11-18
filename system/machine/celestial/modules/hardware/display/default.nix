{username, ...}: let
  settings = {
    sway = {
      output = {
        LVDS-1 = {
          resolution = "1600x900@60Hz";
          position = "1920 0";
        };
      };

      workspaceOutputAssign = [
        {
          workspace = "1";
          output = "LVDS-1";
        }
        {
          workspace = "2";
          output = "LVDS-1";
        }
        {
          workspace = "3";
          output = "LVDS-1";
        }
        {
          workspace = "4";
          output = "LVDS-1";
        }
        {
          workspace = "5";
          output = "LVDS-1";
        }
        {
          workspace = "6";
          output = "LVDS-1";
        }
      ];
    };

    hyprland = {
      monitor = [
        "LVDS-1,1600x900@60,0x0,1"
      ];

      workspace = [
        "1, monitor:LVDS-1, default:true"
        "2, monitor:LVDS-1, default:true"
        "3, monitor:LVDS-1, default:true"
        "4, monitor:LVDS-1, default:true"
        "5, monitor:LVDS-1, default:true"
        "6, monitor:LVDS-1, default:true"
      ];
    };
  };
in {
  home-manager.users.${username}.wayland.windowManager = {
    sway.config = settings.sway;
    hyprland.settings = settings.hyprland;
  };
}
