{
  flake,
  inputs,
  ...
}: {
  imports =
    (flake.lib.genImportsFromDir ./.)
    ++ [
      # provides syncthing.settings.devices.<device>.id
      # most importantly, on mordor, sets
      # "numenor".id = <syncthing device-id for mairon>;

      inputs.utumno.modules.home.syncthing
    ];
}
