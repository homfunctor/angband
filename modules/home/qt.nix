{
  config,
  lib,
  pkgs,
  ...
}:
lib.mkIf config.home.opts.tier.work.enabled {
  home.packages = with pkgs; [
    libsForQt5.qt5.qtwayland
    libsForQt5.qt5ct
    libsForQt5.qtstyleplugin-kvantum
    qt6Packages.qt6ct
    qt6Packages.qtstyleplugin-kvantum
    qt6Packages.qtwayland
  ];
}
