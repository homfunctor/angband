# imported by hosts/<host>/settings/hardware.nix
{
  config,
  flake,
  pkgs,
  ...
}:
flake.lib.reqNTier config "work" {
  boot.kernelParams = ["i915"];
  hardware.graphics.extraPackages = [pkgs.intel-media-driver];
}
