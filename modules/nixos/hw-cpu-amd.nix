# imported by hosts/<host>/settings/hardware.nix
{
  config,
  flake,
  ...
}:
flake.lib.reqNTier config "niceTTY" {
  boot.kernelModules = ["kvm-amd"];

  hardware.cpu.amd.updateMicrocode = true;
}
