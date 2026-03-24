{
  config,
  lib,
  ...
}: let
  cfg = config.home.opts.nvim.plugins.yazi;
in {
  programs.nixvim.plugins.yazi = lib.mkIf cfg.enable {
    enable = true;
  };
}
