{
  inputs,
  pkgs,
  ...
}:
inputs.treefmt-nix.lib.mkWrapper pkgs {
  projectRootFile = "flake.nix";

  programs = {
    alejandra.enable = true;
    deadnix.enable = true;
    statix.enable = true;
  };
}
