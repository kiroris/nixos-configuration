_:

{
  module = {
    binfmt.enable = false;
    boot.enable = true;
    locales.enable = true;
    sound.enable = true;
    timedate.enable = true;
    users.enable = true;
    variables.enable = true;
    xdg.enable = true;



    programs = {
      zsh.enable = true;
    };
  };

  nix.settings.trusted-users = [
    "kiroris"
    "root"
  ];
}
