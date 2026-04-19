# todo: make startup less noisy. noicey.
{
  config,
  lib,
  ...
}: let
  cfg = config.home.opts.nvim.plugins.noice;
in
  lib.mkIf cfg.enable {
    programs.nixvim.plugins.noice = {
      enable = true;

      settings = {
        cmdline = {
          enabled = true;
          format = {
            cmdline = {
              icon = "";
              lang = "vim";
              pattern = "^:";
            };
          };
          view = "cmdline_popup";
        };

        health.checker = true;

        lsp.documentation = {
          opts = {
            render = "plain";
            replace = true;
            win_options = {
              winhighlight = {
                Normal = "NormalFloat";
                FloatBorder = "FloatBorder";
              };
              concealcursor = "n";
              conceallevel = 3;
            };
          };

          hover.enabled = true;
          view = "hover";

          message = {
            enabled = true;
            view = "notify";
          };

          progress = {
            enabled = true;
            format = "lsp_progress";
            formatDone = "lsp_progress";
            view = "snacks";
          };
        };

        messages = {
          enabled = true;
          view = "snacks";
          view_error = "snacks";
          view_history = "messages";
          view_search = "virtualtext";
          view_warn = "snacks";
        };

        notify = {
          enabled = true;
          view = "snacks";
        };

        popupmenu = {
          enabled = true;
          backend = "nui";
          kindIcons = true;
        };

        presets = {
          bottom_search = true;
          command_palette = true;
          inc_rename = true;
          long_message_to_split = true;
          lsp_doc_border = true;
        };

        views = {
          cmdline_popup.border.style = "single";
          cmdline_popupmenu.border.style = "single";
        };
      };
    };
  }
