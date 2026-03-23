{
  config,
  lib,
  osConfig,
  ...
}: let
  cfg =
    osConfig.nixos.opts.stylix.enable
    && config.home.opts.tier.work.enabled;
in
  lib.mkIf cfg {
    programs.niri.settings = {
      cursor = with config.stylix.cursor; {
        inherit size;
        theme = name;
      };

      layout.border = with config.lib.stylix.colors.withHashtag; {
        enable = true;
        active.color = base07;
        inactive.color = base02;
        urgent.color = base08;
      };
    };
  }
