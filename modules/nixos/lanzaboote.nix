# imported by hosts/<host>/settings/core.nix
# todo: check if it works
{
  config,
  flake,
  inputs,
  pkgs,
  ...
}: {
  imports = [inputs.lanzaboote.nixosModules.lanzaboote];

  environment.systemPackages = [pkgs.sbctl];

  boot = flake.lib.reqNTier config "niceTTY" {
    lanzaboote = {
      enable = true;
      pkiBundle = "/var/lib/sbctl";

      autoGenerateKeys.enable = true;
      autoEnrollKeys = {
        enable = true;
        autoReboot = true;
      };
    };

    loader.systemd-boot.enable = false;
  };
}
