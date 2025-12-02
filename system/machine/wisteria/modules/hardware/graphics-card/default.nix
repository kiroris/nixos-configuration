{
  pkgs,
  ...
}:

{
  services.xserver.videoDrivers = [
    "nvidia" # "amdgpu"
  ];

  #nixpkgs.config.cudaSupport = true;

  hardware.nvidia = {
    open = true;
    modesetting.enable = true;
    powerManagement.enable = true;
    dynamicBoost.enable = true;
    nvidiaSettings = false;
  };

  hardware.graphics = {
    enable = true;
    enable32Bit = true;

    extraPackages = with pkgs; [
      nvidia-vaapi-driver
    ];
  };
}
