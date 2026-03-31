{
  config,
  inputs,
  lib,
  pkgs,
  ...
}: {
  imports = [
    # mostly standard list of stuff
    inputs.utumno.modules.nixos.nix-ldLibs
  ];

  config = lib.mkIf config.nixos.opts.tier.work.enabled {
    environment.systemPackages = [pkgs.patchelf];

    programs.nix-ld.enable = true;

    services.envfs.enable = true;
  };
}
