{flake, ...}: {
  imports = with flake.modules.nixos; [
    hw-bluetooth
    hw-cpu-intel
    hw-gpu-intel
    hw-ssd
    hw-t490
    hw-tablet
  ];

  nixos.opts.display = rec {
    extMonitors = ["HDMI-A-1" "HDMI-A-2"];
    mainMonitor = builtins.elemAt monitors 0;
    monitors = ["eDP-1"];
    numWSPerD = 3;
    positions = [[0 0]];
    resolutions = [[1920 1080]];
  };
}
