{
  config,
  lib,
  osConfig,
  pkgs,
  ...
}: let
  enabled =
    config.home.opts.tier.work.enabled
    && osConfig.nixos.opts.wm.niri.enabled;
in
  lib.mkIf enabled {
    programs.niri.settings.binds = with config.lib.niri.actions; {
      "Mod+Alt+L".action.spawn = lib.getExe pkgs.swaylock;
    };
  }
