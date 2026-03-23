{config, ...}: let
  cfg = config.home.opts.nvim.plugins.precognition;
in {
  programs.nixvim.plugins.precognition.enable = cfg.enable;
}
