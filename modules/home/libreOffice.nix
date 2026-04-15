# imported by tier-work
{
  config,
  flake,
  pkgs,
  ...
}:
flake.lib.reqHTier config "work" {
  home.packages = [pkgs.libreoffice-fresh];
}
