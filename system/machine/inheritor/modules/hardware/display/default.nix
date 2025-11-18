{username, ...}: let
  settings = {
    sway = {
      output = {
        eDP-1 = {
          resolution = "1920x1080@60Hz";
          position = "0 0";
          scale = "1.25";
        };
      };

      workspaceOutputAssign = [
        {
          workspace = "1";
          output = "eDP-1";
        }
        {
          workspace = "2";
          output = "eDP-1";
        }
        {
          workspace = "3";
          output = "eDP-1";
        }
        {
          workspace = "4";
          output = "eDP-1";
        }
        {
          workspace = "5";
          output = "eDP-1";
        }
        {
          workspace = "6";
          output = "eDP-1";
        }
      ];
    };

    hyprland = {
      monitor = ["eDP-1,1920x1080@60,0x0,1.25"];

      workspace = [
        "1, monitor:eDP-1, default:true"
        "2, monitor:eDP-1, default:true"
        "3, monitor:eDP-1, default:true"
        "4, monitor:eDP-1, default:true"
        "5, monitor:eDP-1, default:true"
        "6, monitor:eDP-1, default:true"
      ];
    };
  };
in {
  home-manager.users.${username}.wayland.windowManager = {
    sway.config = settings.sway;
    hyprland.settings = settings.hyprland;
  };
}
