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
}: {
  imports = [inputs.lanzaboote.nixosModules.lanzaboote];

  boot = lib.mkIf config.nixos.opts.lanzaboote.enable {
    lanzaboote = {
      enable = true;
      pkiBundle = "/var/lib/sbctl";
    };

    loader.systemd-boot.enable = false;
  };
}
