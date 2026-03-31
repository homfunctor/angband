{
  config,
  lib,
  pkgs,
  ...
}:
lib.mkIf config.home.opts.tier.work.enabled {
  home.packages = [pkgs.pika-backup];
}
