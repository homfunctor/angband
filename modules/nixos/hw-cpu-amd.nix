# imported by hosts/<host>/settings/hardware.nix
{
  config,
  flake,
  ...
}:
flake.lib.reqNTier config "niceTTY" {
  hardware.cpu.amd.updateMicrocode = true;
}
