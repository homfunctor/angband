# imported by hosts/<host>/users/<user>/settings/core.nix
{
  config,
  flake,
  lib,
  ...
}: let
  enabledPlugins = [
    "blink"
    "bufferline"
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
in
  flake.lib.reqHTier config "niceTTY" {
    home.opts.nvim = {
      enable = true;

      plugins = lib.genAttrs enabledPlugins (_: {enable = true;});
    };
  }
