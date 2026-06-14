{
  config,
  lib,
  ...
}: let
  cfg = config.home.opts.nvim.plugins.mini-tabline;
in
  lib.mkIf cfg.enable {
    programs.nixvim.plugins.mini-tabline.enable = true;
  }
