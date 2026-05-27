# imported by hosts/<host>/settings/core.nix
# uses stable version of lix, no compiling
{
  config,
  flake,
  pkgs,
  ...
}:
flake.lib.reqNTier config "niceTTY" {
  nix.package = pkgs.lixPackageSets.latest.lix;
}
