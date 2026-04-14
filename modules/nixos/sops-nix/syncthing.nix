{
  config,
  flake,
  lib,
  ...
}: let
  inherit (flake.lib) mkSec reqNTier;

  cfg = config.nixos.opts.sops.syncthing;
in
  reqNTier config "work" {
    sops.secrets =
      lib.mkIf cfg.enable
      (builtins.listToAttrs
        (lib.concatMap (
            user: [
              {
                name = mkSec [user "syncthing" "cert"];
                value.owner = user;
              }

              {
                name = mkSec [user "syncthing" "key"];
                value.owner = user;
              }
            ]
          )
          config.nixos.opts.userNames));
  }
