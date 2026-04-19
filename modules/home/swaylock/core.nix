# imported by wm-niri
{
  config,
  flake,
  inputs,
  lib,
  osConfig,
  ...
}:
flake.lib.reqHTier config "work" {
  programs.swaylock = {
    enable = true;
    settings = {
      image = lib.mkForce "${inputs.utumno}/assets/durinsgate.jpg";
      scaling = "fill";

      font =
        lib.mkIf osConfig.nixos.opts.stylix.enabled
        config.stylix.fonts.sansSerif.name;
    };
  };
}
