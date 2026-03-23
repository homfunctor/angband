{flake, ...}: {
  imports = with flake;
    (lib.genImportsFromDir ./.)
    ++ [modules.nixos.purpose-work];
}
