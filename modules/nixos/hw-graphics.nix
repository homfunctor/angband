{
  config,
  flake,
  pkgs,
  ...
}:
flake.lib.reqNTier config "work" {
  hardware.graphics = {
    enable = true;

    extraPackages = with pkgs; [
      libGL
      libva
      libva-vdpau-driver
      libvdpau-va-gl
      mesa
    ];

    extraPackages32 = with pkgs.driversi686Linux; [
      libva-vdpau-driver
      libvdpau-va-gl
    ];
  };
}
