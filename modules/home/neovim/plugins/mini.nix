{
  config,
  lib,
  ...
}: let
  cfg = config.home.opts.nvim.plugins.mini;
in {
  programs.nixvim = lib.mkIf cfg.enable {
    plugins.mini = {
      enable = true;
      modules.cursorword = {};
    };
  };
}
