{
  lib,
  config,
  username,
  ...
}:

let
  inherit (lib) mkEnableOption mkIf;

  cfg = config.module.user.impermanence;
in
{
  options = {
    module.user.impermanence.enable = mkEnableOption "Enables home impermanence";
  };

  config = mkIf cfg.enable {
    home.persistence = {
      "/persist/home/${username}" = {
        allowOther = true;

        directories = [
          "Code"
          "Desktop"
          "Games"
          "Downloads"
          "Documents"
          "Music"
          "Pictures"
          "Videos"
          "Trash"
          "Sync"
          ".docker"
          ".emacs.d"
          ".mozilla"
          ".obsidian"
          ".openvpn"
          ".password-store"
          ".themes"
          ".ollama"
          ".config/google-chrome"
          ".config/sops"
          ".config/vesktop"
          ".config/sops-nix"
          ".config/obs-studio"
          ".config/obsidian"
          ".config/VSCodium"
          ".config/dconf"
          ".config/pulse"
          ".config/Thunar"
          ".config/htop"
          ".config/nvim"
          ".config/syncthing"
          ".config/keepassxc"
          ".cache/tealdeer"
          ".local/share/zoxide"
          ".local/share/nix"
          ".local/share/nvf"
          ".local/share/containers"
          ".local/share/Trash"
          ".local/share/TelegramDesktop"
          ".local/share/materialgram"
          ".local/share/keyrings"
          ".local/share/nvim"
          ".local/share/PrismLauncher"
          ".local/state"
          ".vscode-oss"
          ".pki"
          ".ssh"
          ".gnupg"
        ];

        files = [
          ".face"
          ".face.icon"
          ".zsh_history"
          ".cache/cliphist/db"
        ];
      };
    };
  };
}
