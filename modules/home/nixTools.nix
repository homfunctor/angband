{pkgs, ...}: {
  # used but not installed:
  #   nuget-to-json (for Apotheosis) (used within a nix-shell)
  # handled elsewhere:
  #   nix-ld, nix-index-database, nix-output-monitor
  home.packages = with pkgs; [
    dconf2nix
    graphviz
    nix-init
    nix-search
    nixoscope
    nurl
  ];
}
