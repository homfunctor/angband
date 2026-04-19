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
in {
  nixos.opts.stylix.iconTheme = lib.mkIf enabled {
    name = "Flat-Remix-Black-Dark";
    package = pkgs.flat-remix-icon-theme;
  };
}
