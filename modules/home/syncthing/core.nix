{
  config,
  lib,
  pkgs,
  ...
}: let
  inherit (config.home.opts) syncthing tier;

  cfg = syncthing.enable && tier.work.enabled;
in
  lib.mkIf cfg {
    services.syncthing = {
      enable = true;
      package = pkgs.syncthing;
    };
  }
