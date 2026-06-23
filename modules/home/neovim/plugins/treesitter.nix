{
  config,
  lib,
  ...
}: let
  inherit (config.programs.nixvim.plugins.treesitter.package) builtGrammars;

  cfg = config.home.opts.nvim.plugins.treesitter;
in
  lib.mkIf cfg.enable {
    programs.nixvim.plugins.treesitter = {
      enable = true;

      folding.enable = true;
      highlight.enable = true;
      indent.enable = true;

      grammarPackages = with builtGrammars; [
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
