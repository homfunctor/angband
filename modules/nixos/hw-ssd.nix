# imported by hosts/<host>/settings/hardware.nix
{
  config,
  flake,
  ...
}:
flake.lib.reqNTier config "niceTTY" {
  services.fstrim.enable = true;
}
