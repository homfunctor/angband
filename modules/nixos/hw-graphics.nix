# imported by tier-work
# todo: review what is needed
{pkgs, ...}: {
  hardware.graphics = {
    enable = true;
    enable32Bit = true;

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
