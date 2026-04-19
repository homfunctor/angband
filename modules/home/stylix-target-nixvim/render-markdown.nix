# modified render-markdown colors
{
  config,
  lib,
  osConfig,
  ...
}: let
  enabled =
    config.home.opts.nvim.plugins.render-markdown.enable
    && config.home.opts.stylix.targets.nixvim.enable
    && config.home.opts.tier.niceTTY.enabled
    && osConfig.nixos.opts.stylix.enabled;
in
  lib.mkIf enabled {
    programs.nixvim = with config.lib.stylix.colors; {
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
    };
  }
