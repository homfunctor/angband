{
  config,
  lib,
  ...
}: let
  cfg = config.home.opts.nvim.plugins.colorizer;
in {
  programs.nixvim.plugins.colorizer = lib.mkIf cfg.enable {
    enable = true;
    settings.user_default_options.names = false;
  };
}
