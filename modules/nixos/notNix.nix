{
  config,
  inputs,
  lib,
  pkgs,
  ...
}:
lib.mkIf config.nixos.opts.work {
  imports = [
    # mostly standard list of stuff
    inputs.utumno.modules.nixos.nix-ldLibs
  ];

  environment.systemPackages = [pkgs.patchelf];

  programs.nix-ld.enable = true;

  services.envfs.enable = true;
}
