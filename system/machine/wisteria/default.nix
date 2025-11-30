{ config, ... }:

{
  module = {
    boot.enable = true;
  };

  nix.settings.trusted-users = [
    "kiroris"
    "root"
  ];
}
