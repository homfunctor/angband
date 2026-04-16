{
  flake,
  inputs,
  ...
}: {
  imports =
    (flake.lib.genImportsFromDir ./.)
    ++ [
      # provides syncthing.settings.devices.<device>.id
      inputs.utumno.modules.home.syncthing
    ];
}
