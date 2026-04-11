{
  config,
  flake,
  ...
}:
flake.lib.reqNTier config "niceTTY" {
  hardware.cpu.intel.updateMicrocode = true;
}
