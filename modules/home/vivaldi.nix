{
  config,
  flake,
  pkgs,
  ...
}:
flake.lib.reqHTier config "work" {
  home.packages = [pkgs.vivaldi];
}
