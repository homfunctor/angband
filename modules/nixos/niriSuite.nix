{
  config,
  flake,
  ...
}:
flake.lib.reqNTier config "work" {
  programs.seahorse.enable = true;
  services.udisks2.enable = true;
}
