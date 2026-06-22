# imported by hosts/<host>/users/<user>/settings/stylix.nix
{
  config,
  lib,
  osConfig,
  ...
}: let
  enabled =
    config.home.opts.tier.work.enabled
    && osConfig.nixos.opts.wm.niri.enabled
    && osConfig.nixos.opts.stylix.enabled;
in
  lib.mkIf enabled {
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
