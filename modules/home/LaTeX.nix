{
  config,
  lib,
  pkgs,
  ...
}: let
  conformEnabled = config.home.opts.nvim.plugins.conform.enable;
in {
  home.packages = [pkgs.texliveFull];

  programs = lib.mkIf conformEnabled {
    nixvim.plugins.conform-nvim.settings.formatters_by_ft.tex = ["tex-fmt"];

    tex-fmt = {
      enable = true;
      settings = {
        check = false;
        lists = [];
        print = false;
        stdin = false;
        tabchar = "space";
        tabsize = 2;
        verbosity = "warn";
        wrap = true;
        wraplen = 80;
      };
    };
  };
}
