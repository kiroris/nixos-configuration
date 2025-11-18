{
  isWorkstation,
  hyprlandEnable ? false,
  swayEnable ? false,
  wmEnable ? false,
  ...
}:

{
  stylix.targets = {
    helix.enable = false;
    nvf.enable = false;
  };

  module = {
    zed-editor.enable = isWorkstation;
    zathura.enable = isWorkstation;
    stylix.enable = isWorkstation;
    mpv.enable = isWorkstation;
    emacs.enable = isWorkstation;
    firefox.enable = isWorkstation;
    ssh.enable = isWorkstation;
    imv.enable = isWorkstation;
    obs-studio.enable = isWorkstation;

    hyprland.enable = hyprlandEnable && isWorkstation;
    hyprlock.enable = hyprlandEnable && isWorkstation;

    sway.enable = swayEnable && isWorkstation;
    swaylock.enable = swayEnable && isWorkstation;

    hypridle.enable = wmEnable && isWorkstation;
    foot.enable = wmEnable && isWorkstation;
    waybar.enable = wmEnable && isWorkstation;
    wofi.enable = wmEnable && isWorkstation;
    swaync.enable = wmEnable && isWorkstation;

    mpd.enable = true;
    ncmpcpp.enable = true;
    btop.enable = true;
    nvim.enable = true; 
    eza.enable = true;
    git.enable = true;
    fzf.enable = true;
    htop.enable = true;
    tmux.enable = true;
    ripgrep.enable = true;
    fastfetch.enable = true;
    tealdeer.enable = true;
    newsboat.enable = true;
    #helix.enable = true;
    zsh.enable = true;
    zoxide.enable = true;
    yazi.enable = true;
    lazygit.enable = true;

    user = {
      xdg.enable = isWorkstation;
      variables.enable = isWorkstation;
      #impermanence.enable = isWorkstation;
      shellAliases.enable = true;
      packages.enable = true;
    };
  };
}
