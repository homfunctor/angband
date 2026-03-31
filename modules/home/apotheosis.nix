{
  config,
  lib,
  perSystem,
  ...
}:
lib.mkIf config.home.opts.tier.personal.enabled {
  home.packages = [perSystem.self.apotheosis];
}
