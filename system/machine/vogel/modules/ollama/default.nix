{
  lib,
  config,
  ...
}:

let
  inherit (lib) mkEnableOption mkIf;

  cfg = config.module.services.ollama.gpuSupport;
in
{
  options = {
    module.services.ollama.gpuSupport.enable = mkEnableOption "Enable gpuSupport for ollama";
  };

  config = mkIf cfg.enable {
    services.ollama = {
      acceleration = "rocm";
      environmentVariables = {
        HCC_AMDGPU_TARGET = "gfx803"; # used to be necessary, but doesn't seem to anymore
        HSA_OVERRIDE_GFX_VERSION = "8.0.3";
      };
      # results in environment variable "HSA_OVERRIDE_GFX_VERSION=10.3.0"
      rocmOverrideGfx = "8.0.3";
    };
  };
}
