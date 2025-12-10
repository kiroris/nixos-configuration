{
  lib,
  config,
  pkgs,
  ...
}: let
  inherit (lib) mkEnableOption mkIf;

  cfg = config.module.binfmt;
in {
  options = {
    module.binfmt.enable = mkEnableOption "Enable binfmt";
  };

  config = mkIf cfg.enable {
    boot.binfmt = {
      emulatedSystems = ["aarch64-linux"];

      # Our archs that we want to emulate
      registrations = {
        # aarch64-linux.interpreter = "${pkgs.qemu}/bin/qemu-aarch64";
        # i686-linux.interpreter = "${pkgs.qemu}/bin/qemu-i686";
        # x86_64-linux.interpreter = "${pkgs.box64}/bin/box64";

        windows = {
          interpreter = "${pkgs.wine}/bin/wine";
          offset = 0;
          magicOrExtension = "MZ";
        };
      };
    };
  };
}
