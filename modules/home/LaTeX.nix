# imported by hosts/<host>/users/<user>/settings/core.nix
{
  config,
  lib,
  pkgs,
  ...
}: let
  inherit (config.home) opts;
  enabled =
    opts.nvim.enable
    && opts.tier.work.enabled;
in
  lib.mkIf enabled {
    home.packages = [pkgs.texliveFull];

    programs = lib.mkIf opts.nvim.plugins.conform.enable {
      nixvim.plugins.conform-nvim.settings = {
        formatters_by_ft.tex = ["tex-fmt"];
      };

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
