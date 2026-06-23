# temp file for trying out new plugins
{
  config,
  lib,
  ...
}: let
  cfg = config.home.opts.nvim.plugins.temp;
in
  lib.mkIf cfg.enable {
    programs.nixvim = {
      plugins = {
        actions-preview = {
          enable = true;
        };
      };
    };
  }
