{
  config,
  lib,
  pkgs,
  ...
}: let
  cfg = config.home.opts.nvim.plugins.treesitter;
in
  lib.mkIf cfg.enable {
    home.packages = with pkgs; [
      nodejs
      tree-sitter
    ];

    programs.nixvim.plugins = {
      treesitter = {
        enable = true;

        nixvimInjections = true;

        settings = {
          autopairs.enable = true;
          highlight = {
            enable = true;
            # todo: vimtex still complains???
            # vimtex compatibility
            disable = ["latex"];
          };

          auto_install = false;
          ensure_installed = [
            "bash"
            "c"
            "cpp"
            "fish"
            "haskell"
            "javascript"
            "json"
            "just"
            "latex"
            "lean"
            "lua"
            "markdown"
            "markdown_inline"
            "nix"
            "python"
            "qmljs"
            "rust"
            "typescript"
            "xml"
            "yaml"
          ];

          incremental_selection.enable = true;
          indent.enable = true;
        };
      };

      treesitter-context.enable = true;
    };
  }
