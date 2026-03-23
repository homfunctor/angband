{flake, ...}: {
  imports = flake.lib.genImportsFromDir ./.;
}
