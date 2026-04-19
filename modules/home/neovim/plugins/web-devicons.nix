{
  config,
  lib,
  ...
}: let
  cfg = config.home.opts.nvim.plugins.web-devicons;
in
  lib.mkIf cfg.enable {
    programs.nixvim.plugins.web-devicons.enable = true;
  }
