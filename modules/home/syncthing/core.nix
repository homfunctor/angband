{pkgs, ...}: {
  services.syncthing = {
    enable = true;
    package = pkgs.syncthing;
  };
}
