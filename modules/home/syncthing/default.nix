{
  flake,
  inputs,
  ...
}: {
  imports =
    (flake.lib.genImportsFromDir ./.)
    ++ [
      # provides syncthing.settings.devices
      inputs.utumno.modules.home.syncthing
    ];
}
