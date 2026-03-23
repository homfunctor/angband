{
  config,
  lib,
  ...
}: let
  cfg = config.home.opts.nvim.plugins.smartcolumn;
in {
  programs.nixvim.plugins.smartcolumn = lib.mkIf cfg.enable {
    enable = true;
    settings.colorcolumn = "80";
  };
}
