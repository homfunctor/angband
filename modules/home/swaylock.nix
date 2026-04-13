# todo: make it nicerer
{
  config,
  flake,
  inputs,
  lib,
  osConfig,
  pkgs,
  ...
}:
flake.lib.reqHTier config "work" {
  programs =
    {
      swaylock = {
        enable = true;
        settings = {
          image = lib.mkForce "${inputs.utumno}/assets/durinsgate.jpg";
          scaling = "fill";
          font =
            lib.mkIf osConfig.nixos.opts.stylix.enable
            config.stylix.fonts.sansSerif.name;
        };
      };
    } # only set niri bind if niri is enabled
    // {
      programs = lib.mkIf osConfig.nixos.opts.wm.niri.enable {
        niri.settings.binds = with config.lib.niri.actions; {
          "Mod+Alt+L".action.spawn = lib.getExe pkgs.swaylock;
        };
      };
    };
}
