{
  config,
  lib,
  ...
}: let
  cfg = config.home.opts.nvim.plugins.which-key;
in {
  programs.nixvim.plugins.which-key = lib.mkIf cfg.enable {
    enable = true;

    settings = {
      delay = 1000;
      win.border = "single";
    };
  };
}
