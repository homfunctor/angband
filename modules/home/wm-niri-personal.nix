{
  config,
  lib,
  ...
}:
lib.mkIf config.home.opts.tier.work.enabled {
  programs.niri.settings.layout.gaps = 5;
}
