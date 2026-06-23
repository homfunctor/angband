{
  config,
  lib,
  ...
}: let
  cfg = config.home.opts.nvim.plugins.treesitter;
in
  lib.mkIf cfg.enable {
    programs.nixvim.plugins.treesitter = {
      enable = true;

      folding.enable = true;
      highlight.enable = true;
      indent.enable = true;

      grammarPackages = with config.plugins.treesitter.package.builtGrammars; [
        bash
        json
        just
        latex
        lua
        make
        markdown
        nix
        regex
        rust
        toml
        vim
        vimdoc
        xml
        yaml
      ];
    };
  }
