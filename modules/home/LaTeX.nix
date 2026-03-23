{
  config,
  lib,
  pkgs,
  ...
}: let
  conformEnabled =
    config.home.opts.nvim.plugins.conform.enable
    && config.home.opts.nvim.enable;
in
  lib.mkIf config.home.opts.tier.work.enabled {
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
