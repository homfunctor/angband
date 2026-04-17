# imported by tier-work
{
  config,
  flake,
  pkgs,
  ...
}: {
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
