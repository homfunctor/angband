{
  config,
  lib,
  ...
}: let
  cfg = config.home.opts.nvim.plugins.smartcolumn;
in
  lib.mkIf cfg.enable {
    programs.nixvim.plugins.smartcolumn = {
      enable = true;
      settings.colorcolumn = "80";
    };
  }
