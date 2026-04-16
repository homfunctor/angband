# imported by wm-niri
# todo: make it nicer
{
  config,
  flake,
  lib,
  osConfig,
  pkgs,
  ...
}: let
  enabled =
    config.home.opts.tier.work.enabled
    && osConfig.nixos.opts.wm.niri.enable;
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
