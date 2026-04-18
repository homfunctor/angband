{
  flake,
  inputs,
  lib,
  osConfig,
  ...
}: {
  imports =
    [
      ./settings
      flake.modules.home.opts
      inputs.niri-flake.homeModules.niri
      inputs.nixvim.homeModules.nixvim
      inputs.noctalia.homeModules.default
    ]
    ++ (lib.optionals osConfig.nixos.opts.stylix.enable
      [flake.modules.home.stylix]);
}
