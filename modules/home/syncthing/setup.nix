{
  config,
  lib,
  ...
}: let
  inherit (config.home) homeDirectory opts;
  syncOpts = opts.syncthing;

  foldersToMk = builtins.attrNames syncOpts.folders;

  mkFolders = dirList: (
    map (dirName:
      lib.nameValuePair
      "${homeDirectory}/${dirName}" {
        enable =
          builtins.elem syncOpts.deviceName
          syncOpts.folders.${dirName}.devices;
        inherit (syncOpts) versioning;
        inherit (syncOpts.folders.${dirName}) devices;

        id = dirName;
        label = dirName;

        copyOwnershipFromParent = true;
      })
    dirList
  );

  cfg = syncOpts.enable && opts.tier.work.enabled;
in {
  services = lib.mkIf cfg {
    syncthing.settings = {
      folders = builtins.listToAttrs (mkFolders foldersToMk);
    };
  };
}
