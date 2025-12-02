{
  self,
  pkgs,
  config,
  lib,
  wm,
  ...
}:

let
  inherit (lib) mkEnableOption mkIf mkAfter;

  cfg = config.module.waybar;

  audioControl = config.module.defaults.audioControlCmd;
in
{
  options = {
    module.waybar.enable = mkEnableOption "Enables waybar";
  };

  config = mkIf cfg.enable {
    programs.waybar = {
      enable = true;
      systemd.enable = true;
      systemd.target = "graphical-session.target";

      settings = [
        {
          layer = "top";
          position = "top";
          exclusive = true;
          fixed-center = true;
          gtk-layer-shell = true;
          spacing = 0;
          margin-top = 7;
          margin-bottom = 0;
          margin-left = 7;
          margin-right = 7;

          modules-left = [
            "${wm}/workspaces"
          ];

          modules-center = [
            "${wm}/window"
          ];

          modules-right = [
            "tray"
            "pulseaudio"
            "privacy"
            "cpu"
            "memory"
            "network"
            "battery"
            "clock"
            "custom/notification"
          ];

          # Workspaces
          "hyprland/workspaces" = {
            format = "{name}";
            on-click = "activate";
            disable-scroll = true;
            all-outputs = true;
            show-special = true;
            persistent-workspaces = {
              "*" = 6;
            };
          };

          "sway/workspaces" = {
            all-outputs = true;
            disable-scroll = true;
          };

          # Windows
          "hyprland/window" = {
            format = "{title}";
          };

          "sway/window" = {
            format = "{title}";
          };

          # Clock & Calendar
          clock = {
            format = "{:%H:%M}";
            format-alt = "{:%a %b %d, %I:%M %p}";

            actions = {
              on-scroll-down = "shift_down";
              on-scroll-up = "shift_up";
            };
          };

          # Tray
          tray = {
            icon-size = 18;
            show-passive-items = true;
            spacing = 8;
          };

          "hyprland/language" = {
            format = "{}";
            format-en = "US";
            format-ru = "RU";
          };

          "sway/language" = {
            format = "{}";
            format-en = "US";
            format-ru = "RU";
          };

          # Notifications
          "custom/notification" = {
            exec = "${pkgs.swaynotificationcenter}/bin/swaync-client -swb";
            return-type = "json";
            format = "{icon}";
            on-click = "${pkgs.swaynotificationcenter}/bin/swaync-client -t -sw";
            on-click-right = "${pkgs.swaynotificationcenter}/bin/swaync-client -d -sw";
            escape = true;

            format-icons = {
              notification = "󰂚";
              none = "󰂜";
              dnd-notification = "󰂛";
              dnd-none = "󰪑";
              inhibited-notification = "󰂛";
              inhibited-none = "󰪑";
              dnd-inhibited-notification = "󰂛";
              dnd-inhibited-none = "󰪑";
            };
          };

          # Pulseaudio
          pulseaudio = {
            format = "{volume} {icon} / {format_source}";
            format-source = "󰍬";
            format-source-muted = "󰍭";
            format-muted = "󰖁 / {format_source}";
            format-icons = {
              default = [
                "󰕿"
                "󰖀"
                "󰕾"
              ];
            };
            on-click = "${pkgs.pavucontrol}/bin/pavucontrol";
            on-click-right = "${audioControl} set-mute @DEFAULT_AUDIO_SOURCE@ toggle";
            on-scroll-up = "${audioControl} set-volume @DEFAULT_AUDIO_SINK@ 1%+";
            on-scroll-down = "${audioControl} set-volume @DEFAULT_AUDIO_SINK@ 1%-";
            tooltip = false;
          };

          # Battery
          battery = {
            format = "{icon} {capacity}%";
            format-charging = "{icon}  {capacity}%";
            format-icons = [
              ""
              ""
              ""
              ""
              ""
            ];
            format-plugged = " {power} W";
            interval = 5;
            tooltip-format = "{timeTo}, {capacity}%\n {power} W";

            states = {
              warning = 30;
              critical = 15;
            };
          };

          # Cpu usage
          cpu = {
            interval = 5;
            tooltip = false;
            format = " {usage}%";
            format-alt = "{icon0}{icon1}{icon2}{icon3} {usage:>2}% 󰍛";
	          format-icons = [
		          "▁"
              "▂" 
              "▃"
              "▄"
              "▅"
              "▆"
              "▇"
              "█"
	          ];

            states = {
              warning = 70;
              critical = 90;
            };
          };

          # Memory usage
          memory = {
            interval = 5;
            format = " {percentage}%";
            format-alt = " {used:0.1f}G/{total:0.1f}G";

            states = {
              warning = 70;
              critical = 90;
            };
          };

          # Network
          network = {
            format-icons = [
              "󰤯 "
              "󰤟 "
              "󰤢 "
              "󰤥 "
              "󰤨 "
            ];
            format-wifi = "{icon}";
            format-ethernet = "󰈀 "; # 󰈁
            format-disconnected = "⚠";
            tooltip-format-wifi = "WiFi: {essid} ({signalStrength}%)\n {bandwidthUpBytes}  {bandwidthDownBytes}";
            tooltip-format-ethernet = "Ethernet: {ifname}\n {bandwidthUpBytes}  {bandwidthDownBytes}";
            tooltip-format-disconnected = "Disconnected";
            on-click = "${pkgs.networkmanagerapplet}/bin/nm-connection-editor";
            interval = 5;
          };

          # Privacy
          privacy = {
            icon-size = 15;
          };
        }
      ];

      style = mkAfter ''
        ${builtins.readFile "${self}/home/modules/waybar/style.css"}
      '';
    };
  };
}
