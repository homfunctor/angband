# imported by tier-work
{
  config,
  lib,
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
