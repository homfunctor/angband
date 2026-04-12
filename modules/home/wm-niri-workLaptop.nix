{
  config,
  flake,
  ...
}:
flake.lib.reqHTier config "work" {
  programs.niri.settings = {
    input = {
      touchpad = {
        accel-profile = "flat";
        dwt = true;
        dwtp = true;
        scroll-factor = 0.5;
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
