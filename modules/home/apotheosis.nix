# imported by tier-personal
{
  config,
  flake,
  perSystem,
  ...
}:
flake.lib.reqHTier config "personal" {
  home.packages = [perSystem.self.apotheosis];
}
