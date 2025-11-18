{
  pkgs,
  self,
  ...
}:

{
  # Graphics card settings
  nixpkgs.overlays = [
    (import "${self}/system/nixos/overlays/vaapiIntel")
  ];

  hardware.graphics = {
    enable = true;
    enable32Bit = true;

    extraPackages = with pkgs; [
      mesa
      vaapiIntel
      #intel-media-sdk
    ];
  };
}
