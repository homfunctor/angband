# imported by hosts/<host>/users/<user>/settings/core.nix
{
  config,
  flake,
  perSystem,
  ...
}:
flake.lib.reqHTier config "personal" {
  home.packages = [perSystem.self.civ5-map-image];
}
