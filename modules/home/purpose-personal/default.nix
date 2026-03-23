{flake, ...}: {
  imports = with flake;
    (lib.genImportsFromDir ./.)
    ++ [modules.home.purpose-work];
}
