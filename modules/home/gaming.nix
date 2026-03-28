{
  config,
  lib,
  pkgs,
  ...
}:
lib.mkIf config.home.opts.tier.personal.enabled {
  home.packages = with pkgs; [
    hashdeep
    heroic
    ludusavi
    lutris
    protonplus
    steamcmd
    umu-launcher
    wineWow64Packages.fonts
    wineWow64Packages.waylandFull
    winetricks
    xrandr
  ];
}
