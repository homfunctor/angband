{
  config,
  lib,
  pkgs,
  ...
}:
lib.mkIf config.home.opts.tier.work.enabled {
  home.packages = with pkgs; [
    teams-for-linux
    zoom-us
  ];
}
