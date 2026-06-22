{flake, ...}: {
  imports = with flake.modules.home; [
    stylix-gtk
    stylix-niri
    stylix-nixvim
    stylix-noctalia
    stylix-qt
  ];
}
