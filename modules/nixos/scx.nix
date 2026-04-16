# imported by hosts/<host>/settings/core.nix
{
  config,
  flake,
  ...
}:
flake.lib.reqNTier config "niceTTY" {
  services.scx = {
    enable = true;
    scheduler = "scx_lavd";
  };
}
