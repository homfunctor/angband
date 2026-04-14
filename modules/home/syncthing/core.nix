# imported by tier-work
{
  config,
  flake,
  inputs,
  lib,
  osConfig,
  pkgs,
  ...
}: let
  inherit (config.home.opts) syncthing tier;

  enabled = syncthing.enable && tier.work.enabled;
in
  lib.mkIf enabled {
    services.syncthing = {
      enable = true;
      package = pkgs.syncthing;
    };
  }
