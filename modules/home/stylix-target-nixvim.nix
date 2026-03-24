{
  config,
  lib,
  osConfig,
  ...
}: let
  inherit (lib) mkIf mkMerge;
  cfg =
    osConfig.nixos.opts.stylix.enable
    && config.home.opts.tier.niceTTY.enabled;
in
  mkIf cfg {
    home.opts.stylix.targets.nixvim = {
      enable = true;
      plugin = "base16-nvim";
      transparentBackground = {
        main = true;
        signColumn = true;
      };
    };

    programs.nixvim = with config.lib.stylix.colors;
      mkMerge [
        # modified highlight settings for snacks indent
        {
          highlightOverride = with withHashtag; {
            SnacksIndent.fg = base03;
            SnacksIndentScope.fg = base08;
          };
        }

        # modified render-markdown colors
        (mkIf config.home.opts.nvim.plugins.render-markdown.enable {
          extraConfigLua = with withHashtag; ''
            vim.api.nvim_set_hl(0, 'RenderMarkdownBorder', { link = 'Normal' })

            vim.api.nvim_set_hl(0, 'RenderMarkdownHeading1', { bold = true, foreground = '${base0E}' })
            vim.api.nvim_set_hl(0, 'RenderMarkdownHeading2', { bold = true, foreground = '${base0A}' })
            vim.api.nvim_set_hl(0, 'RenderMarkdownHeading3', { bold = true, foreground = '${base08}' })
            vim.api.nvim_set_hl(0, 'RenderMarkdownCode', { background = '${base02}', foreground = '${base07}' })
            vim.api.nvim_set_hl(0, 'RenderMarkdownBlockquote', { italic = true, foreground = '${base03}'})

            -- force non-rounded borders in the render window
            vim.api.nvim_create_autocmd('FileType', {
              pattern = 'render-markdown',
              callback = function()
                vim.opt_local.winhl = 'Normal:Normal,NormalNC:Normal,FloatBorder:Normal'
              end
            })
          '';
        })
      ];
  }
