{
  config,
  lib,
  osConfig,
  pkgs,
  ...
}: let
  inherit (config.home.opts) tier wm;
  inherit (osConfig.nixos.opts) display;

  mirrorExe = "${pkgs.wl-mirror}/bin/wl-present";
  mirrorCmd = "${mirrorExe} mirror ${display.mainMonitor}";
  mirrorArgs = "--fullscreen-output";
  presentCmd = "pkill wl-mirror ||  ${mirrorCmd} ${mirrorArgs}";

  enabled =
    tier.work.enabled
    && wm.niri.screencast.enable
    && osConfig.nixos.opts.wm.niri.enable;
in
  lib.mkIf enabled {
    home.packages = [pkgs.wl-mirror];

    programs.niri.settings.binds = with config.lib.niri.actions; {
      "Mod+P".action.spawn-sh = "${presentCmd} ${builtins.elemAt display.extMonitors 0}";
      "Mod+Shift+P".action.spawn-sh = "${presentCmd} ${builtins.elemAt display.extMonitors 1}";
    };
  }
