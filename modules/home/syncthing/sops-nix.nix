# todo: setup certs and keys
{
  config,
  flake,
  lib,
  osConfig,
  ...
}: let
  inherit (config.home.opts) userName;
  inherit (flake.lib) mkSecPath;

  cfg = osConfig.nixos.opts.sops.syncthing;
in {
  services.syncthing = lib.mkIf cfg.enable {
    # strictly declarative
    cert = mkSecPath osConfig [
      userName
      "syncthing"
      "cert"
    ];
    key = mkSecPath osConfig [
      userName
      "syncthing"
      "key"
    ];

    overrideDevices = true;
    overrideFolders = true;
  };
}
