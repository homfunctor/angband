{inputs, ...}: let
  inherit
    (inputs.nixpkgs.lib)
    attrNames
    concatStringsSep
    filterAttrs
    hasSuffix
    mkOption
    pipe
    removeSuffix
    splitString
    types
    ;

  inherit (inputs.nixpkgs.lib.filesystem) listFilesRecursive;
in
  with types; rec {
    # list of names of all non-default.nix nix files in directory
    # for automating option generation
    nameListFromDir = dir:
      map (removeSuffix ".nix")
      (attrNames
        (filterAttrs
          (name: type:
            type == "regular" && hasSuffix ".nix" name)
          (builtins.readDir dir)));

    # strictly only for auto-defining imports
    # use carefully!
    genImportsFromDir = dir:
      map toString
      (builtins.filter
        (p: p != (dir + "/default.nix") && hasSuffix ".nix" p)
        (listFilesRecursive dir));

    # mkOption utilities
    mkOpt = type: default: description:
      mkOption {
        inherit type default description;
      };

    mkAttrOpt = mkOpt attrs;

    mkBoolOpt = mkOpt bool;

    mkFloatOpt = mkOpt float;

    mkIntOpt = mkOpt int;

    mkListOpt = type: mkOpt (listOf type);

    mkPathOpt = mkOpt path;

    mkPkgOpt = mkOpt package;

    mkStrOpt = mkOpt str;

    # sops utilities
    mkSec = path: concatStringsSep "/" (map (v: removeSuffix "/" v) path);
    mkSecPath = config: path: config.sops.secrets."${mkSec path}".path;

    # niri utility
    splitArg = arg: splitString " " arg;
  }
