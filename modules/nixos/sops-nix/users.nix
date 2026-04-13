{
  config,
  flake,
  lib,
  ...
}: let
  inherit (config.nixos) opts;
  inherit (opts) sops tier userNames;

  enabled = sops.users.enable && tier.niceTTY.enabled;
in {
  config = lib.mkIf enabled {
    sops.secrets = builtins.listToAttrs (
      map (
        user: {
          name = flake.lib.mkSec [user "hashedPassword"];
          value = {
            owner = user;
            neededForUsers = true;
          };
        }
      )
      userNames
    );

    users = {
      mutableUsers = false;
      users = lib.genAttrs userNames (user: {
        hashedPasswordFile = flake.lib.mkSecPath config [user "hashedPassword"];
      });
    };
  };
}
