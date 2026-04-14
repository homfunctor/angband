{
  flake,
  inputs,
  ...
}: {
  imports =
    (flake.lib.genImportsFromDir ./.)
    ++ [
      # todo: make sure it checks tier and syncthing bool
      # provides syncthing.settings.devices.<device>.id
      inputs.utumno.modules.home.syncthing
    ];
}
