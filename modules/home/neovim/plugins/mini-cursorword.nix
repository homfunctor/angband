{
  config,
  lib,
  ...
}: let
  cfg = config.home.opts.nvim.plugins.mini-cursorword;
in
  lib.mkIf cfg.enable {
    programs.nixvim.plugins.mini-cursorword.enable = true;
  }
