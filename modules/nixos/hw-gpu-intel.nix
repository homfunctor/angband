{
  config,
  lib,
  pkgs,
  ...
}:
lib.mkIf config.nixos.opts.tier.work.enabled {
  boot.kernelParams = ["i915"];
  hardware.graphics.extraPackages = [pkgs.intel-media-driver];
}
