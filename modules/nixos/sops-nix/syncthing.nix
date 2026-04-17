{
  config,
  flake,
  lib,
  ...
}: let
  inherit (flake.lib) mkSec;

  enabled =
    config.nixos.opts.sops.syncthing.enable
    && config.nixos.opts.tier.work.enabled;
in
  lib.mkIf enabled {
    sops.secrets =
      builtins.listToAttrs
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
        config.nixos.opts.userNames);
  }
