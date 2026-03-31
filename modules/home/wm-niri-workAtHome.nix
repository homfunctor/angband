{
  config,
  lib,
  ...
}:
lib.mkIf config.home.opts.tier.work.enabled {
  programs.niri.settings.layout = {
    border.width = 4;
    gaps = 0;
  };
}
