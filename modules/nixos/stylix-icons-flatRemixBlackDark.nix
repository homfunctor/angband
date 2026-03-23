# hm module for stylix imports and applies this
{
  config,
  lib,
  pkgs,
  ...
}: let
  cfg =
    config.nixos.opts.stylix.enable
    && config.nixos.opts.tier.work.enabled;
in {
  nixos.opts.stylix.iconTheme = lib.mkIf cfg {
    name = "Flat-Remix-Black-Dark";
    package = pkgs.flat-remix-icon-theme;
  };
}
