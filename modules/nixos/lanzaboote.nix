# imported by hosts/<host>/settings/core.nix
{
  config,
  flake,
  inputs,
  ...
}: {
  imports = [inputs.lanzaboote.nixosModules.lanzaboote];

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
