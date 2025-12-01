{
  config,
  pkgs,
  lib,
  ...
}:
let
  inherit (lib) mkEnableOption mkIf;

  cfg = config.module.binfmt;
in
{
  options.module.binfmt = {
    enable = mkEnableOption "Enable module binfmt";
  };

  config = mkIf cfg.enable {
    boot.binfmt = {
      emulatedSystems = [ "aarch64-linux" ];

      # our archs that we want to emulate
      registrations = {
        aarch64-linux.interpreter = "${pkgs.qemu}/bin/qemu-aarch64";
        i686-linux.interpreter = "${pkgs.qemu}/bin/qemu-i686";
        x86_64-linux.interpreter = "${pkgs.box64}/bin/box64";
      };
    };
  };
}
