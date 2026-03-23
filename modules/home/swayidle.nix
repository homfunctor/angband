{
  config,
  lib,
  pkgs,
  ...
}:
lib.mkIf config.home.opts.tier.work.enabled {
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
