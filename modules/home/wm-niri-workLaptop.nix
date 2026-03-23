{
  config,
  lib,
  ...
}:
lib.mkIf config.home.opts.tier.work.enabled {
  programs.niri.settings = {
    input = {
      touchpad = {
        accel-profile = "flat";
        dwt = true;
        dwtp = true;
        tap = false;
      };
      trackpoint.accel-profile = "flat";
    };

    layout = {
      border.width = 4;
      gaps = 0;
    };
  };
}
