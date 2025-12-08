_:

{
  module = {
    binfmt.enable = true;
    bluetooth.enable = true;
    boot.enable = true;
    #lanzaboote
    locales.enable = true;
    minimal.enable = true;
    network.enable = true;
    #nixos-ng - kill my system whathell??
    plymouth.enable = true;
    sound.enable = true;
    timedate.enable = true;
    users.enable = true;
    variables.enable = true;
    #virtualization
    xdg.enable = true;
    #zapret

    stylix.enable = true;

    programs = {
      #dconf
      #gaming.enable = true;
      #gnupg
      hm.enable = true;
      kdeconnect.enable = true;
      #mtr
      nh.enable = true;
      #pihole
      systemPackages.enable = true;
      #thunar
      xdg-portal.enable = true;
      zsh.enable = true;
    };

    security = {
      enable = true;
      enableBootOptions = true;
      disableIPV6 = true;
    };

    services = { # normal check only that enabled
      #adguard-home
      #bolt
      #cpu-autofreq
      #fwupd
      #greetd.enable = false; # not want
      #hyprland.enable = false;
      irqbalance.enable = true;
      journald.enable = true;
      #netbird
      oomd.enable = true;
      polkit.enable = true;
      #postgresql
      #printing
      #scx
      #searxng
      ssh.enable = true;
      #syncthing
      #tailscale
      #tlp
      #udev
      #unbound
      zram.enable = true;
    };

  };

  nix.settings.trusted-users = [
    "kiroris"
    "root"
  ];
}
