{
  config,
  flake,
  lib,
  osConfig,
  ...
}: let
  inherit (config.home) opts;
  inherit (flake.lib) mkSecPath;

  enabled =
    osConfig.nixos.opts.sops.syncthing.enable
    && opts.syncthing.enable
    && opts.tier.work.enabled;
in
  lib.mkIf enabled {
    services.syncthing = {
      # strictly declarative
      cert = mkSecPath osConfig [
        opts.userName
        "syncthing"
        "cert"
      ];
      key = mkSecPath osConfig [
        opts.userName
        "syncthing"
        "key"
      ];

      overrideDevices = true;
      overrideFolders = true;
    };
  }
