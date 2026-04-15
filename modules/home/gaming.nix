{
  config,
  flake,
  pkgs,
  ...
}:
flake.lib.reqHTier config "personal" {
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
