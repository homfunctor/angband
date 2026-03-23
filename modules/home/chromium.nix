# todo: settings
{
  config,
  lib,
  ...
}:
lib.mkIf config.home.opts.tier.work.enabled {
  programs.chromium.enable = true;
}
