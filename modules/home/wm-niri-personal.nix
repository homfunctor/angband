# imported by hosts/<host>/users/<user>/settings/core.nix
{
  config,
  flake,
  ...
}:
flake.lib.reqHTier config "personal" {
  programs.niri.settings.layout.gaps = 6;
}
