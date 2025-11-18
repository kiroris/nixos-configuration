{
  lib,
  config,
  self,
  pkgs,
  ...
}:

let
  inherit (lib) 
    mkEnableOption 
    mkIf
    ;

  cfg = config.module.zsh;
in
{
  options = {
    module.zsh.enable = mkEnableOption "Enables zsh";
  };

  config = mkIf cfg.enable {
    home.file.".p10k.zsh".source = "${self}/home/modules/zsh/p10k.zsh";

    programs.zsh = {
      enable = true;
      enableCompletion = true;
      autosuggestion.enable = true;
      syntaxHighlighting.enable = true;

      initExtraFirst = "source ${pkgs.zsh-powerlevel10k}/share/zsh-powerlevel10k/powerlevel10k.zsh-theme";

      initContent = ''
        POWERLEVEL9K_MODE="ascii"
        POWERLEVEL9K_DISABLE_CONFIGURATION_WIZARD="true"
        #export GPG_TTY=$TTY

        [[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
      '';
    };
  };
}
