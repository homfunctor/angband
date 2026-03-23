{
  config,
  lib,
  pkgs,
  ...
}: let
  cfg =
    config.nixos.opts.stylix.enable
    && config.nixos.opts.tier.work.enabled;
in
  lib.mkIf cfg {
    stylix.cursor = {
      name = "Nordzy-cursors-white";
      package = pkgs.nordzy-cursor-theme;
      size = 32;
    };
  }
