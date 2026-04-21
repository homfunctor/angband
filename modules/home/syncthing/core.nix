# imported by tier-work
{pkgs, ...}: {
  services.syncthing = {
    enable = true;
    package = pkgs.syncthing;
  };
}
