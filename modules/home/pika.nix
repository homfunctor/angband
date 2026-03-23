{
  config,
  lib,
  pkgs,
  ...
}:
lib.mkIf config.home.opts.tier.personal.enabled {
  home.packages = [pkgs.pika-backup];
}
