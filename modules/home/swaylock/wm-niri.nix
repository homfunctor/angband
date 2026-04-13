{
  config,
  flake,
  lib,
  osConfig,
  pkgs,
  ...
}:
flake.lib.reqHTier config "work" {
  programs = lib.mkIf osConfig.nixos.opts.wm.niri.enable {
    niri.settings.binds = with config.lib.niri.actions; {
      "Mod+Alt+L".action.spawn = lib.getExe pkgs.swaylock;
    };
  };
}
