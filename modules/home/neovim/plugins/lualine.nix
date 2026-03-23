{
  config,
  lib,
  pkgs,
  ...
}: let
  inherit (lib) mkIf;

  cfg = config.home.opts.nvim.plugins.lualine;
in {
  config.programs.nixvim = mkIf cfg.enable {
    plugins.colorscheme.base16.enable = true;
    extraPlugins = [
      (pkgs.vimUtils.buildVimPlugin {
        name = "lualine-so-fancy";
        src = pkgs.fetchFromGitHub {
          owner = "meuter";
          repo = "lualine-so-fancy.nvim";
          rev = "6ba7b138f2ca435673eb04c2cf85f0757df69b07";
          hash = "sha256-Ctdt8kCG+4ynpfEHpvUhFQpbhcaLg0hoPX+yPkUQGS0=";
        };
      })
    ];

    plugins.lualine = mkIf cfg.enable {
      enable = true;
      theme = "base16";

      settings = {
        options = {
          component_separators = {
            left = "";
            right = "";
          };
          section_separators = {
            left = "";
            right = "";
          };
        };

        sections = {
          lualine_a = ["fancy_mode"];
          lualine_b = ["fancy_branch" "fancy_diff" "fancy_diagnostics"];
          lualine_x = ["fancy_macro" "fancy_lsp_servers"];
          lualine_y = ["fancy_filetype"];
          lualine_z = ["fancy_searchcount" "fancy_location"];
        };
      };
    };
  };
}
