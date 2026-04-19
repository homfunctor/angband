{
  config,
  flake,
  lib,
  osConfig,
  ...
}: let
  enabled =
    config.home.opts.tier.work.enabled
    && osConfig.nixos.opts.wm.niri.enabled
    && osConfig.nixos.opts.wm.niri.appBinds.enable;
in
  lib.mkIf enabled
  {
    programs = let
      inherit (flake.lib) splitArg;

      noctCmd = cmd:
        [(lib.getExe config.programs.noctalia-shell.package) "ipc" "call"]
        ++ (splitArg cmd);
    in {
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
