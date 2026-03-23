{lib, ...}: let
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
in {
  home.opts.nvim.plugins = lib.genAttrs enabledPlugins (_: {enable = true;});
}
