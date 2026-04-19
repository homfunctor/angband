{
  config,
  lib,
  ...
}: let
  cfg = config.home.opts.nvim.plugins.colorizer;
in
  lib.mkIf cfg.enable {
    programs.nixvim.plugins.colorizer = {
      enable = true;
      settings.user_default_options.names = false;
    };
  }
