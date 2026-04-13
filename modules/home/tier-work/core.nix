{flake, ...}: {
  imports = with flake.modules.home; [
    eza
    firefox
    imageEditing
    kitty
    libreOffice
    qt
    sioyek
    syncthing
    xournal
    yazi
  ];

  home.opts.tier.work.enabled = true;
}
