{
  config,
  lib,
  pkgs,
  ...
}: let
  enabled =
    config.nixos.opts.stylix.enable
    && config.nixos.opts.tier.work.enabled;
in
  lib.mkIf enabled {
    stylix.cursor = {
      name = "Nordzy-cursors-white";
      package = pkgs.nordzy-cursor-theme;
      size = 32;
    };
  }
