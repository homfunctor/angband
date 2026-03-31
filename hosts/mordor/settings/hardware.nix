{flake, ...}: {
  imports = with flake.modules.nixos; [
    hw-cpu-amd
    hw-gpu-amd
    hw-printing
    hw-ssd
    hw-tablet
  ];

  nixos.opts.display = rec {
    mainMonitor = builtins.elemAt monitors 1;
    monitors = [
      "DP-1"
      "HDMI-A-1"
      "DP-3"
    ];
    numWSPerD = 2;
    resolutions = [
      [1680 1050]
      [1920 1080]
      [1366 768]
    ];
    positions = [
      [0 0]
      [1680 0]
      [0 1050]
    ];
  };
}
