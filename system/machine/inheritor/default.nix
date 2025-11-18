_:

{
  module = {
    sound.enable = true;
    bluetooth.enable = true;
    boot.enable = true;
    locales.enable = true;
    network.enable = true;
    timedate.enable = true;
    users.enable = true;
    variables.enable = true;
    virtualisation.enable = true;
    stylix.enable = true;
    minimal.enable = true;
    nixos-ng.enable = true;

    security = {
      enable = true;
      enableBootOptions = true;
      disableIPV6 = true;
    };

    defaults = {
      ssh.pubKeys = [
        "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIEp2Lg8VtWNv3S3Kyw2HKuVqxx9kAmN1LjIol/Li/L94"
      ];
    };

    services = {
      bolt.enable = true;
      tlp.enable = true;
      fwupd.enable = true;
      polkit.enable = true;
      udev.enable = true;
      zram.enable = true;
      greetd.enable = true;
      oomd.enable = true;
      tailscale.enable = true;
      irqbalance.enable = true;
      syncthing.enable = true;
    };

    programs = {
      dconf.enable = true;
      gnupg.enable = true;
      hm.enable = true;
      nh.enable = true;
      xdg-portal.enable = true;
      zsh.enable = true;
      gaming.enable = true;
      systemPackages.enable = true;
    };
  };

  nix.settings.trusted-users = [
    "corg"
    "root"
  ];
}
