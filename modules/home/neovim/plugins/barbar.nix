{
  config,
  lib,
  ...
}: let
  cfg = config.home.opts.nvim.plugins.barbar;
in {
  programs.nixvim.plugins.barbar = lib.mkIf cfg.enable {
    enable = true;
    keymaps = {
      silent = true;
      next = "<TAB>";
      previous = "<S-TAB>";
    };
  };
}
