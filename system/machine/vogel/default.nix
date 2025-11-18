{
  config,
  ...
}:

{
  module = {
    boot.enable = true;
    locales.enable = true;
    network.enable = true;
    timedate.enable = true;
    users.enable = true;
    variables.enable = true;
    stylix.enable = true;
    virtualisation.enable = true;
    nixos-ng.enable = true;

    programs = {
      gnupg.enable = true;
      zsh.enable = true;
      systemPackages.enable = true;
    };

    security = {
      enable = true;
      enableBootOptions = true;
    };

    defaults = {
      network = {
        iface = "enp9s0";
        ip = "192.168.0.103";
        gw = "192.168.1.1";
        mask = "255.255.255.0";
        cidr = "24";
      };

      ssh.pubKeys = [
        "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIIXByEG3SJJOMxKEAl8azfR/fNMuvXfNcCaEFrdIdn91"
      ];
    };

    services = {
      zram.enable = true;
      jellyfin.enable = true;
      mediamtx.enable = true;
      forgejo.enable = true;
      valkey.enable = true;
      tailscale.enable = true;
      oomd.enable = true;
      irqbalance.enable = true;
      journald.enable = true;
      nginx.enable = true;
      ssh.enable = true;
      searxng.enable = true;
    };
  };

  nix.settings.trusted-users = [
    "corg"
    "root"
  ];
}
