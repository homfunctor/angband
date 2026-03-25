{
  flake,
  inputs,
  ...
}: {
  imports = [
    ./settings
    flake.modules.home.opts
    inputs.niri-flake.homeModules.niri
    inputs.nixvim.homeModules.nixvim
    inputs.noctalia.homeModules.default
  ];
}
