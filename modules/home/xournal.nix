# imported by tier-work
{
  config,
  flake,
  lib,
  osConfig,
  pkgs,
  ...
}: let
  enabled =
    osConfig.nixos.opts.wm.niri.enabled
    && osConfig.nixos.opts.wm.niri.appBinds.enable;
in
  flake.lib.reqHTier config "work" {
    home.packages = [pkgs.xournalpp];

    programs = lib.mkIf enabled {
      niri.settings.binds = with config.lib.niri.actions; {
        "Mod+Ctrl+Shift+J".action.spawn =
          lib.getExe pkgs.xournalpp;
      };
    };
  }
