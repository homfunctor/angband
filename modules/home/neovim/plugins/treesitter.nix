{
  config,
  lib,
  ...
}: let
  cfg = config.home.opts.nvim.plugins.treesitter;

  grammars = config.programs.nixvim.plugins.treesitter.package.builtGrammars;
in
  lib.mkIf cfg.enable {
    programs.nixvim.plugins.treesitter = {
      enable = true;

      folding.enable = true;
      highlight.enable = true;
      indent.enable = true;

      grammarPackages = with grammars; [
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
