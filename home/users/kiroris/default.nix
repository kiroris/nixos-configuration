{
  isWorkstation,
  hyprlandEnable ? false,
  swayEnable ? false,
  wmEnable ? false,
  ...
}:

{
  #stylix.targets = {
  #  helix.enable = false;
  #  nvf.enable = false;
  #};

  module = {






    #hyprland.enable = hyprlandEnable && isWorkstation;
    #hyprlock.enable = hyprlandEnable && isWorkstation;

    sway.enable = swayEnable && isWorkstation;
    swaylock.enable = swayEnable && isWorkstation;

    hypridle.enable = wmEnable && isWorkstation;
    foot.enable = wmEnable && isWorkstation;
    waybar.enable = wmEnable && isWorkstation;
    wofi.enable = wmEnable && isWorkstation;
    swaync.enable = wmEnable && isWorkstation;







    #user = {
    #  xdg.enable = isWorkstation;
    #  variables.enable = isWorkstation;
    #  #impermanence.enable = isWorkstation;
    #  shellAliases.enable = true;
    #  packages.enable = true;
    #};
  };
}
