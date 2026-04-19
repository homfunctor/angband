# imported by hosts/<host>/settings/core.nix
# requires imperative steps:
# enable module
# 'sudo sbctl create-keys'
# rebuild, verify with 'sbctl verify'
# reboot, enable secure boot, login
# 'sudo sbctl enroll-keys --microsoft'
# reboot, verify with 'bootctl status'
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
    };

    loader.systemd-boot.enable = false;
  };
}
