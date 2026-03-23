{osConfig, ...}: {
  programs.noctalia-shell.settings.notifications = {
    enabled = true;

    monitors = [osConfig.nixos.opts.display.mainMonitor];
  };
}
