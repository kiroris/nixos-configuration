{
  config,
  lib,
  pkgs,
  inputs,
  isWorkstation,
  wmEnable,
  ...
}:

let
  inherit (lib) mkEnableOption mkIf optionals;

  cfg = config.module.user.packages;
in
{
  options.module.user.packages = {
    enable = mkEnableOption "Enable user packages";
  };

  config = mkIf cfg.enable {
    fonts.fontconfig.enable = true;

    home.packages =
      with pkgs;
      [
        # Utils
        bat
        libqalculate
        tokei
        shellcheck
        pre-commit
        deadnix
        statix
        ffmpeg-full
        inputs.any-nix-shell

        # Security
        age
        sops
      ]
      ++ optionals isWorkstation [
        # Minecraft
        (prismlauncher.override { jdks = [ pkgs.temurin-jre-bin pkgs.zulu pkgs.zulu8 pkgs.graalvm-ce ]; })

        # Fonts
        nerd-fonts.jetbrains-mono
        nerd-fonts.ubuntu-mono
        nerd-fonts.iosevka
        departure-mono
        corefonts

        # Programming
        python3

        # DevOps Utils
        docker-compose

        # Chats
        materialgram
        kdePackages.neochat
        psi-plus
        vesktop

        # Misc
        keepassxc
        dconf2nix
        gpick
        gat
        qbittorrent
        krita
      ]
      ++ optionals wmEnable [
        imagemagick
        grim
        slurp
        wl-clipboard
        wl-screenrec
        vulkan-validation-layers
        wayland
        hyprpicker
        waypaper
        cliphist
        imv
        gtk3
        dbus
        libnotify
        glib
        swww
        xdg-utils
        pavucontrol
        eww
        networkmanagerapplet
        brightnessctl
      ];
  };
}
