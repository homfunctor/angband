{
  lib,
  pkgs,
  ...
}: {
  environment.systemPackages = with pkgs; [
    (lib.hiPrio
      uutils-coreutils-noprefix) # we rusty here
    just
    nix-output-monitor
    sbctl # for setting up lanzaboote
    ssh-to-age
    wget
  ];
}
