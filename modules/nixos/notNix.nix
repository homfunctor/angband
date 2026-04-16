# imported by hosts/<host>/settings/core.nix
{
  config,
  flake,
  inputs,
  pkgs,
  ...
}: {
  imports = [
    # mostly standard list of stuff
    inputs.utumno.modules.nixos.nix-ldLibs
  ];

  config = flake.lib.reqNTier config "work" {
    environment.systemPackages = [pkgs.patchelf];

    programs.nix-ld.enable = true;

    services.envfs.enable = true;
  };
}
