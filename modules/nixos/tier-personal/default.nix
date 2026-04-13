{flake, ...}: {
  imports = with flake;
    (lib.genImportsFromDir ./.)
    ++ [modules.nixos.tier-work];
}
