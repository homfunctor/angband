{flake, ...}: {
  imports = with flake.modules.home; [
    stylix # disable unless purpose-work is enabled
    stylix-target-gtk
    stylix-target-niri
    stylix-target-nixvim
    stylix-target-noctalia
    stylix-target-qt
  ];
}
