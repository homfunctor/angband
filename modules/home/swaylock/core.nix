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
        lib.mkIf osConfig.nixos.opts.stylix.enable
        config.stylix.fonts.sansSerif.name;
    };
  };
}
