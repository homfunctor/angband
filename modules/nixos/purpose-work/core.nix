{pkgs, ...}: {
  programs.dconf.enable = true;

  services = {
    dbus = {
      enable = true;
      packages = with pkgs; [
        dconf
        gcr
        gnome-keyring
        gnome-settings-daemon
        libsecret
      ];
    };

    fwupd.enable = true;
    gvfs.enable = true;
    libinput.enable = true;
    timesyncd.enable = true;
    upower.enable = true;
    xserver.enable = false;
  };
}
