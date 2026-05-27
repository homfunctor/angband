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
    ssh-to-age # for sops-nix
    wget
  ];
}
