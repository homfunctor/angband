# imported by tier-personal
{
  config,
  flake,
  lib,
  perSystem,
  ...
}:
flake.lib.reqHTier config "personal" {
  home.packages = [perSystem.self.apotheosis];
}
