# modified highlight settings for snacks indent
{
  config,
  lib,
  osConfig,
  ...
}: let
  enabled =
    config.home.opts.stylix.targets.nixvim.enable
    && config.home.opts.tier.niceTTY.enabled
    && osConfig.nixos.opts.stylix.enable;
in
  lib.mkIf enabled {
    programs.nixvim = with config.lib.stylix.colors; {
      highlightOverride = with withHashtag; {
        SnacksIndent.fg = base03;
        SnacksIndentScope.fg = base08;
      };
    };
  }
