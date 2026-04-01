{
  flake,
  inputs,
  ...
}: {
  imports =
    (flake.lib.genImportsFromDir ./.)
    ++ [inputs.utumno.modules.home.syncthing];
}
