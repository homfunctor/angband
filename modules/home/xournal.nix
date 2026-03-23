{
  config,
  lib,
  osConfig,
  pkgs,
  ...
}: {
  home.packages = [pkgs.xournalpp];

  programs = lib.mkIf osConfig.nixos.opts.wm.niri.appBinds.enable {
    niri.settings.binds = with config.lib.niri.actions; {
      "Mod+Ctrl+Shift+J".action.spawn = lib.getExe pkgs.xournalpp;
    };
  };
}
