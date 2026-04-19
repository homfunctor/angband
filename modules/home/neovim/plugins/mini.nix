{
  config,
  lib,
  ...
}: let
  cfg = config.home.opts.nvim.plugins.mini;
in
  lib.mkIf cfg.enable {
    programs.nixvim = {
      plugins.mini = {
        enable = true;
        modules.cursorword = {};
      };
    };
  }
