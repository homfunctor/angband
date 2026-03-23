{
  config,
  flake,
  lib,
  ...
}: let
  cfg = config.nixos.opts.sops.syncthing;
  inherit (flake.lib) mkSec;
in {
  sops.secrets = lib.mkIf cfg.enable (builtins.listToAttrs (lib.concatMap (
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
