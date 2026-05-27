{
  config,
  lib,
  pkgs,
  ...
}: let
  cfg = config.home.opts.nvim.plugins.lsp;
in
  lib.mkIf cfg.enable {
    programs.nixvim.plugins = {
      lsp = {
        enable = true;

        inlayHints = true;

        servers = {
          basedpyright.enable = true;
          bashls.enable = true;

          clangd.enable = true;

          fish_lsp.enable = true;
          jsonls.enable = true;
          lemminx.enable = true;

          lua_ls = {
            enable = true;
            settings.telemetry.enable = false;
          };

          marksman.enable = true;
          nixd = {
            enable = true;
            settings.formatting.command = ["${lib.getExe pkgs.alejandra}"];
          };
          qmlls.enable = true;
          sqls.enable = true;
          statix.enable = true;
          typos_lsp = {
            enable = true;
            extraOptions.init_options.diagnosticSeverity = "Hint";
          };
        };
      };

      lspkind.enable = true;

      lspsaga = {
        enable = true;
        settings = {
          lightbulb.enable = false;
          outline.keys.jump = "<cr>";
          scrollPreview = {
            scrollDown = "<c-d>";
            scrollUp = "<c-u>";
          };
          ui.border = "single";
        };
      };
    };
  }
