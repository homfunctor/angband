{flake, ...}: {
  imports = with flake.modules.home; [
    firefox
    imageEditing
    kitty
    libreOffice
    qt
    sioyek
    starship
    syncthing
    xournal
  ];
}
