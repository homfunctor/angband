{flake, ...}: {
  imports = with flake;
    (lib.genImportsFromDir ./.)
    ++ [modules.home.tier-work];
}
