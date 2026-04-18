{
  flake,
  inputs,
  ...
}: {
  imports = [
    ./settings
    flake.modules.nixos.opts
    flake.modules.nixos.stylix
    inputs.home-manager.nixosModules.home-manager
    inputs.stylix.nixosModules.stylix
  ];
}
