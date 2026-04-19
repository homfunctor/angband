{
  config,
  lib,
  pkgs,
  ...
}: let
  cfg = config.home.opts.nvim.plugins.blink;
in
  lib.mkIf cfg.enable {
    home.packages = [pkgs.wordnet];

    programs.nixvim = {
      extraPlugins = [pkgs.vimPlugins.blink-nerdfont-nvim];

      plugins = {
        blink-cmp-dictionary.enable = true;
        blink-cmp-spell.enable = true;
        blink-compat.enable = true;
        blink-emoji.enable = true;
        blink-ripgrep.enable = true;

        blink-cmp = {
          enable = true;
          setupLspCapabilities = true;

          settings = {
            appearance = {
              nerd_font_variant = "mono";
              use_nvim_cmp_as_default = true;

              kind_icons = {
                Class = "󱡠";
                Color = "󰏘";
                Constant = "󰏿";
                Constructor = "󰒓";
                Emoji = "";
                Enum = "󰦨";
                EnumMember = "󰦨";
                Error = "󰏭";
                Event = "󱐋";
                Field = "󰜢";
                File = "󰈔";
                Folder = "󰉋";
                Function = "󰊕";
                Hint = "󰏭";
                Information = "󰏮";
                Interface = "󱡠";
                Keyword = "󰻾";
                Method = "";
                Module = "󰅩";
                Operator = "󰪚";
                Property = "󰖷";
                Reference = "󰬲";
                Snippet = "󱄽";
                Struct = "󱡠";
                Text = "󰉿";
                TypeParameter = "󰬛";
                Unit = "󰪚";
                Value = "󰦨";
                Variable = "󰆦";
                Warning = "󰏯";
              };
            };

            cmdline = {
              completion = {
                list.selection.preselect = false;
                menu.auto_show = true;
              };

              keymap = {
                "<C-CR>" = [
                  "select_and_accept"
                  "fallback"
                ];
                "<C-u>" = [
                  "scroll_documentation_up"
                  "fallback"
                ];
                "<C-d>" = [
                  "scroll_documentation_down"
                  "fallback"
                ];
                "<C-n>" = [
                  "select_next"
                  "fallback"
                ];
                "<C-p>" = [
                  "select_prev"
                  "fallback"
                ];
                "<A-q>" = [
                  "hide"
                  "fallback"
                ];
                "<C-j>" = [
                  "snippet_forward"
                  "fallback"
                ];
                "<C-k>" = [
                  "snippet_backward"
                  "fallback"
                ];
              };
            };

            completion = {
              documentation = {
                auto_show = true;
                window.border = "single";
              };

              ghost_text.enabled = true;

              list.selection = {
                auto_insert = false;
                preselect = false;
              };

              menu = {
                border = "single";
                draw = {
                  columns = [
                    {
                      __unkeyed-1 = "label";
                    }

                    {
                      __unkeyed-1 = "kind_icon";
                      __unkeyed-2 = "kind";
                      gap = 1;
                    }

                    {
                      __unkeyed-1 = "source_name";
                    }
                  ];

                  gap = 1;
                  treesitter = ["lsp"];
                };
              };
            };

            fuzzy = {
              implementation = "rust";
              prebuilt_binaries.download = false;
            };

            keymap = {
              "<C-CR>" = [
                "select_and_accept"
                "fallback"
              ];
              "<C-b>" = [
                "scroll_documentation_up"
                "fallback"
              ];
              "<C-f>" = [
                "scroll_documentation_down"
                "fallback"
              ];
              "<C-n>" = [
                "select_next"
                "fallback"
              ];
              "<C-p>" = [
                "select_prev"
                "fallback"
              ];
              "<A-q>" = [
                "hide"
                "fallback"
              ];
            };

            signature = {
              enabled = true;
              window.border = "single";
            };

            sources = {
              default = lib.mkDefault [
                "buffer"
                "dictionary"
                "emoji"
                "lsp"
                "path"
                "ripgrep"
                "spell"
              ];

              providers = {
                dictionary = {
                  min_keyword_length = 3;
                  module = "blink-cmp-dictionary";
                  name = "Dict";
                };

                emoji = {
                  module = "blink-emoji";
                  name = "Emoji";
                  score_offset = 15;
                };

                lsp.score_offset = 4;

                ripgrep = {
                  module = "blink-ripgrep";
                  name = "Ripgrep";
                  score_offset = 100;
                  opts = {
                    backend = {
                      context_size = 5;
                      max_filesize = "1M";
                      project_root_fallback = true;
                      search_casing = "--ignore-case";
                    };

                    additional_paths = {};
                    additional_rg_options = {};
                    debug = false;
                    fallback_to_regex_highlighting = true;
                    ignore_paths = {};
                    prefix_min_len = 3;
                    project_root_marker = ".git";
                  };
                };

                spell = {
                  module = "blink-cmp-spell";
                  name = "Spell";
                  score_offset = 1;
                };
              };
            };
          };
        };
      };
    };
  }
