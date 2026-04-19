# imported by hosts/<host>/settings/stylix.nix
{
  config,
  lib,
  pkgs,
  ...
}: let
  enabled =
    config.nixos.opts.stylix.enabled
    && config.nixos.opts.tier.work.enabled;
in
  lib.mkIf enabled {
    stylix.cursor = {
      name = "Nordzy-cursors-white";
      package = pkgs.nordzy-cursor-theme;
      size = 32;
    };
  }
