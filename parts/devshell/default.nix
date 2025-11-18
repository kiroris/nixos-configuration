{
  perSystem =
    { pkgs, ... }:
    {
      # For nix develop
      devShells.default = pkgs.mkShell {
        name = "flake-template";
        meta.description = "DevShell for Flake";

        # Env
        EDITOR = "${pkgs.neovim-unwrapped}/bin/nvim";

        shellHook = ''
          exec fish
        '';

        packages = with pkgs; [
          yazi
          git
          curl
          neovim-unwrapped
          fish
          tmux
          lynx
          ripgrep
          htop
          disko
          fzf
        ];
      };
    };
}
