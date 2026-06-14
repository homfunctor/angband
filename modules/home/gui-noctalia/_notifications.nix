{
  config,
  flake,
  osConfig,
  ...
}:
flake.lib.reqHTier config "work" {
  programs.noctalia.settings.notifications = {
    enabled = true;

    monitors = [osConfig.nixos.opts.display.mainMonitor];
  };
}
