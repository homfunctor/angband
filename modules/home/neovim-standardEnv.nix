# imported by hosts/<host>/users/<user>/settings/core.nix
{
  config,
  lib,
  ...
}: let
  enabledPlugins = [
    "barbar"
    "blink"
    "colorizer"
    "conform"
    "lint"
    "lsp"
    "lualine"
    "mini"
    "noice"
    "precognition"
    "render-markdown"
    "smartcolumn"
    "snacks"
    "treesitter"
    "vimtex"
    "web-devicons"
    "which-key"
  ];

  enabled =
    config.opts.home.tier.niceTTY.enabled
    && config.opts.home.nvim.enabled;
in
  lib.mkIf enabled {
    home.opts.nvim = {
      enable = true;

      plugins = lib.genAttrs enabledPlugins (_: {enable = true;});
    };
  }
