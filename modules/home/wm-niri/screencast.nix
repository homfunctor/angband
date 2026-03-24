{
  config,
  lib,
  osConfig,
  pkgs,
  ...
}: let
  inherit (osConfig.nixos.opts) display;

  mirrorExe = "${pkgs.wl-mirror}/bin/wl-present";
  mirrorCmd = "${mirrorExe} mirror ${display.mainMonitor}";
  mirrorArgs = "--fullscreen-output";
  presentCmd = "pkill wl-mirror ||  ${mirrorCmd} ${mirrorArgs}";

  cfg = config.home.opts.wm.niri.screencast;
in
  lib.mkIf (config.home.opts.tier.work.enabled
    && cfg.enable) {
    home.packages = [pkgs.wl-mirror];

    programs.niri.settings.binds = with config.lib.niri.actions; {
      "Mod+P".action.spawn-sh = "${presentCmd} ${builtins.elemAt display.extMonitors 0}";
      "Mod+Shift+P".action.spawn-sh = "${presentCmd} ${builtins.elemAt display.extMonitors 1}";
    };
  }
