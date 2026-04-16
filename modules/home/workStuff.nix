# imported by hosts/<host>/users/<user>/settings/core.nix
{
  config,
  flake,
  pkgs,
  ...
}:
flake.lib.reqHTier config "work" {
  home.packages = with pkgs; [
    teams-for-linux
    zoom-us
  ];
}
