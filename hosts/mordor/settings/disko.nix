{
  flake,
  inputs,
  ...
}: {
  imports = [
    flake.modules.nixos.disko-mordor
    inputs.disko.nixosModules.disko
  ];
}
