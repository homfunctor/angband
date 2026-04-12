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
