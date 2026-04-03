# this was painful, but it works
# todo: maybe clean this up
{
  config,
  lib,
  ...
}: let
  inherit (config.home) homeDirectory opts;
  dirNames = builtins.attrNames opts.syncthing.folders;

  cfg = opts.syncthing;
in {
  config = lib.mkIf cfg.enable {
    services.syncthing.settings = let
      folders = builtins.listToAttrs (
        map (dirName:
          lib.nameValuePair
          "${homeDirectory}/${dirName}" {
            enable = true;
            inherit (cfg) versioning;
            inherit (cfg.folders.${dirName}) devices;

            id = dirName;
            label = dirName;

            copyOwnershipFromParent = true;
          })
        dirNames
      );
    in {
      inherit folders;
    };
  };
}
