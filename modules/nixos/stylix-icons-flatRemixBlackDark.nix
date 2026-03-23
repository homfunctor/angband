# hm module for stylix imports and applies this
{
  config,
  lib,
  pkgs,
  ...
}: let
  cfg = config.nixos.opts.stylix;
in {
  nixos.opts.stylix.iconTheme = lib.mkIf cfg.enable {
    name = "Flat-Remix-Black-Dark";
    package = pkgs.flat-remix-icon-theme;
  };
}
