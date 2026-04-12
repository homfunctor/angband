{
  config,
  flake,
  ...
}:
flake.lib.reqNTier config "niceTTY" {
  services.fstrim.enable = true;
}
