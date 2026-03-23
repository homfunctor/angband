{pkgs, ...}: {
  boot.kernelParams = ["i915"];
  hardware.graphics.extraPackages = [pkgs.intel-media-driver];
}
