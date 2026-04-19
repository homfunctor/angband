# imported by wm-niri
# can be extended for other wms
# todo: make it nicer
{
  config,
  lib,
  osConfig,
  pkgs,
  ...
}: let
  enabled =
    config.home.opts.tier.work.enabled
    && osConfig.nixos.opts.wm.niri.enabled;
in
  lib.mkIf enabled {
    services.swayidle = let
      lockExe = lib.getExe pkgs.swaylock;
    in {
      enable = true;

      timeouts = [
        {
          timeout = 600;
          command = lockExe;
        }
      ];

      events.before-sleep = lockExe;
    };
  }
