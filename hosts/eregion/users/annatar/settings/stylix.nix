{flake, ...}: {
  imports = with flake.modules.home; [
    stylix-target-gtk
    stylix-target-niri
    stylix-target-nixvim
    stylix-target-noctalia
    stylix-target-qt
  ];

  home.opts.stylix.targets = {
    gtk.enable = true;
    nixvim.enable = true;
    noctalia-shell.enable = true;
    qt.enable = true;
  };
}
