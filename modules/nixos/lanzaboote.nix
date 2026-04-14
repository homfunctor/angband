# enable module
# 'sudo sbctl create-keys'
# rebuild, verify with 'sbctl verify'
# reboot, enable secure boot, login
# 'sudo sbctl enroll-keys --microsoft'
# reboot, verify with 'bootctl status'
{
  config,
  inputs,
  lib,
  ...
}: let
  enabled =
    config.nixos.opts.lanzaboote.enable
    && config.nixos.opts.tier.niceTTY.enabled;
in {
  imports = [inputs.lanzaboote.nixosModules.lanzaboote];

  config = lib.mkIf enabled {
    boot = {
      lanzaboote = {
        enable = true;
        pkiBundle = "/var/lib/sbctl";
      };

      loader.systemd-boot.enable = false;
    };
  };
}
