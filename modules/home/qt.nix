# imported by tier-work
{pkgs, ...}: {
  home.packages = with pkgs; [
    qt6Packages.qt6ct
    qt6Packages.qtstyleplugin-kvantum
    qt6Packages.qtwayland
  ];
}
