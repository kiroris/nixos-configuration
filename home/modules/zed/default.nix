{
  config,
  lib,
  pkgs,
  ...
}:

with lib;

let
  inherit (lib) mkEnableOption mkDefault;

  cfg = config.module.zed-editor;
in
{
  options = {
    module.zed-editor.enable = mkEnableOption "Enables zed-editor";
  };

  config = mkIf cfg.enable {
     programs.zed-editor = {
        enable = true;

        extensions = ["nix" "toml" "make"];

        userSettings = {
            assistant = {
                enabled = false;
            };

            hour_format = "hour24";
            auto_update = false;
            terminal = {
                alternate_scroll = "off";
                blinking = "off";
                copy_on_select = true;
                dock = "bottom";
                detect_venv = {
                    on = {
                        directories = [".env" "env" ".venv" "venv"];
                        activate_script = "default";
                    };
                };

                env = {
                    TERM = "alacritty";
                };

                line_height = "comfortable";
                option_as_meta = false;
                button = false;
                shell = "system"; 
                toolbar = {
                    title = true;
                };
                working_directory = "current_project_directory";
            };

            lsp = {
                rust-analyzer = {

                    binary = {
                        path = lib.getExe pkgs.rust-analyzer;
                        path_lookup = true;
                    };
                };
                nix = { 
                    binary = { 
                        path_lookup = true; 
                    }; 
                };

                elixir-ls = {
                    binary = {
                        path_lookup = true; 
                    };
                    settings = {
                        dialyzerEnabled = true;
                    };
                };
            };

            languages = {
              nix = {
                format_on_save = true;
                language_servers = [ "nixd" ];
                formatter = {
                  external = {
                    command = "nixfmt";
                    arguments = [ ];
                  };
                };
              };
            };

            vim_mode = true;
            ## tell zed to use direnv and direnv can use a flake.nix enviroment.
            load_direnv = "shell_hook";
            show_whitespaces = "all" ;
            ui_font_size = mkDefault 11;
            buffer_font_size = mkDefault 12;
      };
    };
  };
}
