{
  flake,
  inputs,
  ...
}: {
  imports = [
    ./settings
    flake.modules.nixos.opts
    inputs.stylix.nixosModules.stylix
  ];
}
