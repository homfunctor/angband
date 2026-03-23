{
  flake,
  inputs,
  ...
}: {
  imports = [
    flake.modules.nixos.disko-eregion
    inputs.disko.nixosModules.disko
  ];
}
