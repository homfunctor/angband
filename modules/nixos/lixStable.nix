# imported by hosts/<host>/settings/core.nix
# uses stable version of lix, no compiling
{
  config,
  flake,
  pkgs,
  ...
}:
flake.lib.reqNTier config "niceTTY" {
  nix.package = pkgs.lixPackageSets.stable.lix;

  nixpkgs.overlays = [
    (_: prev: {
      inherit
        (prev.lixPackageSets.stable)
        colmena
        nix-eval-jobs
        nix-fast-build
        nixpkgs-review
        ;
    })
  ];
}
