_:

{
  module = {
    binfmt.enable = false;
    bluetooth.enable = true;
    boot.enable = true;
    lanzaboote.enable = false;
    locales.enable = true;
    minimal.enable = false;
    network.enable = true;
    nixos-ng.enable = false;
    plymouth.enable = false;
    sound.enable = true;
    timedate.enable = true;
    users.enable = true;
    variables.enable = true;
    virtualization.enable = false;
    xdg.enable = true;
    zapret.enable = false;

    stylix.enable = true;

    programs = {
      dconf.enable = false;
      gaming.enable = false;
      gnupg.enable = false;
      hm.enable = false;
      mtr.enable = false;
      nh.enable = false;
      pihole.enable = false;
      systemPackages.enable = false;
      thunar.enable = false;
      xdg-portal.enable = false;
      zsh.enable = true;
    };

    security = {
      enable = true;
      enableBootOptions = true;
      disableIPV6 = true;
    };

  };

  nix.settings.trusted-users = [
    "kiroris"
    "root"
  ];
}
