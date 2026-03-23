{
  flake,
  inputs,
  ...
}: {
  imports = [
    flake.modules.home.gui-noctalia
  ];
  home.opts.display.backgrounds = [
    "${inputs.utumno}/assets/eregion.png"
  ];
}
