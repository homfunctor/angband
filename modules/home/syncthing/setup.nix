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
        # only enable if desired by this device
        # assumes 'autoAcceptFolders' is false
        # todo: still get notification that must be rejected
        #   in web-ui. can that be done automatically?
        enable =
          builtins.elem syncOpts.deviceName
          syncOpts.folders.${dirName}.devices;
        inherit (syncOpts) versioning;
        # declared in ./folders
        inherit (syncOpts.folders.${dirName}) devices;

        id = dirName;
        label = dirName;

        copyOwnershipFromParent = true;
      })
    dirList
  );
in {
  services = {
    syncthing.settings = {
      folders = builtins.listToAttrs (mkFolders foldersToMk);
    };
  };
}
