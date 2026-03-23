{
  config,
  flake,
  lib,
  osConfig,
  ...
}: let
  inherit (flake.lib) splitArg;

  noctCmd = cmd:
    [(lib.getExe config.programs.noctalia-shell.package) "ipc" "call"]
    ++ (splitArg cmd);

  cfg = osConfig.nixos.opts.wm.niri.appBinds;
in {
  programs = lib.mkIf cfg.enable {
    niri.settings.binds = with config.lib.niri.actions; {
      "Mod+R".action.spawn = noctCmd "launcher toggle";
      "Mod+X".action.spawn = noctCmd "sessionMenu toggle";
      "Mod+MouseMiddle" = {
        allow-when-locked = true;
        action.spawn = noctCmd "volume muteOutput";
      };
      "Mod+MouseBack".action.spawn = noctCmd "volume decrease";
      "Mod+MouseForward".action.spawn = noctCmd "volume increase";
    };
  };
}
