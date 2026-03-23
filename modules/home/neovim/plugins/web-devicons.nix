{config, ...}: let
  cfg = config.home.opts.nvim.plugins.web-devicons;
in {programs.nixvim.plugins.web-devicons.enable = cfg.enable;}
