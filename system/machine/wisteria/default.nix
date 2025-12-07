_:

{
  module = {
    binfmt.enable = true;
    bluetooth.enable = true;
    boot.enable = true;
    #lanzaboote.enable = false;
    locales.enable = true;
    #minimal.enable = false;
    network.enable = true;
    #nixos-ng.enable = true;
    #plymouth.enable = false;
    sound.enable = true;
    timedate.enable = true;
    users.enable = true;
    variables.enable = true;
    #virtualization.enable = false;
    xdg.enable = true;
    #zapret.enable = false;

    stylix.enable = true;
    nix-config.enable = true;

    programs = {
      #dconf.enable = false;
      #gaming.enable = false;
      #gnupg.enable = false;
      #hm.enable = false;
      #mtr.enable = false;
      nh.enable = true;
      #pihole.enable = false;
      #systemPackages.enable = false;
      #thunar.enable = false;
      #xdg-portal.enable = true;
      zsh.enable = true;
    };

    security = {
      enable = true;
      enableBootOptions = true;
      disableIPV6 = true;
    };

    services = {
      #adguard-home.enable = false;
      #bolt.enable = false;
      #cpu-autofreq.enable = false;
      #fwupd.enable = false;
      #greetd.enable = false;
      #homepage-dashboard.enable = false;
      #hyprland.enable = false;
      #irqbalance.enable = false;
      journald.enable = true;
      #netbird.enable = false;
      #oomd.enable = false;
      polkit.enable = true;
      #postgresql.enable = false;
      #printing.enable = false;
      #scx.enable = false;
      #searxng.enable = false;
      ssh.enable = true;
      #syncthing.enable = false;
      #tailscale.enable = false;
      #tlp.enable = false;
      #udev.enable = false;
      #unbound.enable = false;
      zram.enable = true;
    };

  };

  nix.settings.trusted-users = [
    "kiroris"
    "root"
  ];
}
