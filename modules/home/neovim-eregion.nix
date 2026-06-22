# imported by hosts/<host>/users/<user>/settings/core.nix
# todo: will eventually be more lightweight than neovim-mordor
{
  config,
  flake,
  lib,
  ...
}: let
  enabledPlugins = [
    "blink-cmp"
    "colorizer"
    "conform"
    "lint"
    "lsp"
    "lualine"
    "mini-cursorword"
    "mini-tabline"
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
