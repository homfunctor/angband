{
  config,
  lib,
  ...
}: let
  cfg = config.home.opts.nvim.plugins.barbar;
in
  lib.mkIf cfg.enable {
    programs.nixvim.plugins.barbar = {
      enable = true;
      keymaps = {
        silent = true;
        close.key = "<C-L>";
        next.key = "<TAB>";
        previous.key = "<S-TAB>";
      };
    };
  }
