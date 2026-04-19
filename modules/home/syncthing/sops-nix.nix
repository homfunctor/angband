{
  config,
  flake,
  lib,
  osConfig,
  ...
}: let
  inherit (config.home) opts;
  inherit (flake.lib) mkSecPath;
in
  lib.mkIf osConfig.nixos.opts.sops.syncthing.enable {
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
