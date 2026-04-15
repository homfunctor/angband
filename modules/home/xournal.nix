{
  config,
  lib,
  osConfig,
  pkgs,
  ...
}: let
  inherit (config.home.opts) tier;
  inherit (osConfig.nixos.opts) wm;

  enabled = wm.niri.enable && wm.niri.appBinds.enable;
in
  lib.mkIf tier.work.enabled {
    home.packages = [pkgs.xournalpp];

    programs = lib.mkIf enabled {
      niri.settings.binds = with config.lib.niri.actions; {
        "Mod+Ctrl+Shift+J".action.spawn =
          lib.getExe pkgs.xournalpp;
      };
    };
  }
