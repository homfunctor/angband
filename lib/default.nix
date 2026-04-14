{inputs, ...}: let
  inherit
    (inputs.nixpkgs.lib)
    attrNames
    concatStringsSep
    filterAttrs
    hasSuffix
    mkIf
    mkOption
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
    # use carefully - recursive!
    genImportsFromDir = dir:
      map toString
      (builtins.filter
        (p: p != (dir + "/default.nix") && hasSuffix ".nix" p)
        (listFilesRecursive dir));

    # mkOption utilities
    mkOpt = type: default: description:
      mkOption {inherit type default description;};

    mkAttrOpt = mkOpt attrs;

    mkBoolOpt = mkOpt bool;

    mkFloatOpt = mkOpt float;

    mkIntOpt = mkOpt int;

    mkListOpt = type: mkOpt (listOf type);

    mkPathOpt = mkOpt path;

    mkPkgOpt = mkOpt package;

    mkStrOpt = mkOpt str;

    # sops utilities
    mkSec = path:
      concatStringsSep "/"
      (map
        (v: removeSuffix "/" v)
        path);
    mkSecPath = cfg: path: cfg.sops.secrets."${mkSec path}".path;

    # niri utility
    splitArg = arg: splitString " " arg;

    # slightly simpler tier code
    # ex:
    #   flake.lib.reqNTier config "work" {foo};
    #   is equivalent to
    #   lib.mkIf config.nixos.opts.tier.work.enabled {foo};
    reqHTier = cfg: tier: attrSet: mkIf cfg.home.opts.tier.${tier}.enabled attrSet;
    reqNTier = cfg: tier: attrSet: mkIf cfg.nixos.opts.tier.${tier}.enabled attrSet;
  }
