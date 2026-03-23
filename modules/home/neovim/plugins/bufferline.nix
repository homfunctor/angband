{
  config,
  lib,
  ...
}: let
  inherit (lib) mkIf;
  cfg = config.home.opts.nvim.plugins.bufferline;
in {
  programs.nixvim = mkIf cfg.enable {
    plugins.bufferline = {
      enable = true;
      settings.options = {
        always_show_bufferline = false;
        diagnostics = "nvim_lsp";
        separatorStyle = "slope";
      };
    };

    keymaps = mkIf cfg.enable [
      {
        action = "<cmd>BufferLineCycleNext<cr>";
        key = "<Tab>";
        mode = "n";
        options.desc = "cycle next";
      }

      {
        action = "<cmd>BufferLineCyclePrev<cr>";
        key = "<S-Tab>";
        mode = "n";
        options.desc = "cycle previous";
      }
    ];
  };
}
