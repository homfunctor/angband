{
  config,
  lib,
  osConfig,
  ...
}: let
  enabled =
    config.home.opts.tier.work.enabled
    && osConfig.nixos.opts.gui.noct.enable;
in
  lib.mkIf enabled {
    programs.noctalia-shell.settings.notifications = {
      enabled = true;

      monitors = [osConfig.nixos.opts.display.mainMonitor];
    };
  }
