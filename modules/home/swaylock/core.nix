# imported by wm-niri
{
  config,
  flake,
  inputs,
  lib,
  osConfig,
  ...
}: let
  enabled =
    config.home.opts.tier.work.enabled
    && osConfig.nixos.opts.wm.niri.enable;
in
  lib.mkIf enabled {
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
