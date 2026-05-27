# imported by hosts/<host>/users/<user>/settings/core.nix
{
  config,
  flake,
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
    "render-markdown"
    "smartcolumn"
    "snacks"
    "vimtex"
    "web-devicons"
    "which-key"
  ];
in
  flake.lib.reqHTier config "niceTTY" {
    home.opts.nvim.plugins =
      lib.genAttrs enabledPlugins
      (_: {enable = true;});
  }
