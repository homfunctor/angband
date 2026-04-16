# imported by hosts/<host>/users/<user>/settings/core.nix
{
  config,
  flake,
  pkgs,
  ...
}:
flake.lib.reqHTier config "personal" {
  home.packages = [pkgs.pika-backup];
}
