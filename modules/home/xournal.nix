{
  config,
  lib,
  osConfig,
  pkgs,
  ...
}: let
  inherit (osConfig.nixos) wm;
  inherit (config.home.opts) tier;
  cfg = wm.niri.enable && wm.niri.appBinds.enable;
in
  lib.mkIf tier.work.enabled {
    home.packages = [pkgs.xournalpp];

    programs = lib.mkIf cfg {
      niri.settings.binds = with config.lib.niri.actions; {
        "Mod+Ctrl+Shift+J".action.spawn =
          lib.getExe pkgs.xournalpp;
      };
    };
  }
