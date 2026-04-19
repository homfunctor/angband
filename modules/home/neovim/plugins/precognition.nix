{
  config,
  lib,
  ...
}: let
  cfg = config.home.opts.nvim.plugins.precognition;
in
  lib.mkIf cfg.enable {
    programs.nixvim.plugins.precognition.enable = true;
  }
