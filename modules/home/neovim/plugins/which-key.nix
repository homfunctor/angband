{
  config,
  lib,
  ...
}: let
  cfg = config.home.opts.nvim.plugins.which-key;
in
  lib.mkIf cfg.enable {
    programs.nixvim.plugins.which-key = {
      enable = true;

      settings = {
        delay = 1000;
        win.border = "single";
      };
    };
  }
