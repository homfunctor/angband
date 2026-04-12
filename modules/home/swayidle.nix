# todo: make it nicer
{
  config,
  flake,
  lib,
  pkgs,
  ...
}:
flake.lib.reqHTier config "work" {
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
