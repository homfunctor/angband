{
  config,
  lib,
  perSystem,
  ...
}:
lib.mkIf config.tier.personal.enabled {
  home.packages = [perSystem.self.apotheosis];
}
