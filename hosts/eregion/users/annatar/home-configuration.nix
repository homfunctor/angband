{
  config,
  flake,
  inputs,
  lib,
  ...
}: {
  imports = [
    ./settings
    flake.modules.home.opts
    inputs.niri-flake.homeModules.niri
    inputs.nixvim.homeModules.nixvim
    inputs.noctalia.homeModules.default
    inputs.stylix.homeModules.stylix
  ];

  stylix = lib.mkIf config.home.opts.tier.work {
    inherit (config.home.opts.stylix) targets;
  };
}
