# imported by hosts/<host>/settings/hardware.nix
{
  config,
  flake,
  ...
}:
flake.lib.reqNTier config "niceTTY" {
  hardware.cpu.intel.updateMicrocode = true;
}
