{flake, ...}: {
  imports = with flake.modules.home; [
    firefox
    imageEditing
    kitty
    libreOffice
    qt
    sioyek
    syncthing
    xournal
  ];

  home.opts.tier.work.enabled = true;
}
