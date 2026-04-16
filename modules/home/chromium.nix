# imported by hosts/<host>/users/<user>/settings/core.nix
# todo: settings
{
  config,
  flake,
  ...
}:
flake.lib.reqHTier config "work" {
  programs.chromium.enable = true;
}
