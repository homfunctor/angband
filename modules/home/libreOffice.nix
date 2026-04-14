# imported by tier-work
{
  config,
  flake,
  inputs,
  lib,
  osConfig,
  pkgs,
  ...
}:
flake.lib.reqHTier config "work" {
  home.packages = [pkgs.libreoffice-fresh];
}
