{
  config,
  lib,
  ...
}: let
  inherit (config.home) homeDirectory;
  dirName = "Nix";

  cfg = config.home.opts.syncthing;
in {
  config = lib.mkIf cfg.folder."${dirName}".enable {
    services.syncthing.settings = {
      folders."${homeDirectory}/${dirName}" = {
        enable = true;
        inherit (cfg) versioning;

        id = dirName;
        label = dirName;

        copyOwnershipFromParent = true;

        devices = [
          # "eregion"
          # "mirkwood"
          "mordor"
          # "numenor"
        ];
      };
    };
  };
}
