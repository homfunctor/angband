{
  flake,
  inputs,
  ...
}: {
  imports = [
    ./settings
    flake.modules.nixos.opts
    inputs.home-manager.nixosModules.home-manager
    inputs.stylix.nixosModules.stylix
  ];
}
