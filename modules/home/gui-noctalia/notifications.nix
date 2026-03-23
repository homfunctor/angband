{
  config,
  lib,
  osConfig,
  ...
}:
lib.mkIf config.home.opts.tier.work.enabled {
  programs.noctalia-shell.settings.notifications = {
    enabled = true;

    monitors = [osConfig.nixos.opts.display.mainMonitor];
  };
}
