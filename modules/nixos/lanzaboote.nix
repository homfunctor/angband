# enable module
# 'sudo sbctl create-keys'
# rebuild, verify with 'sbctl verify'
# reboot, enable secure boot, login
# 'sudo sbctl enroll-keys --microsoft'
# reboot, verify with 'bootctl status'
{inputs, ...}: {
  imports = [inputs.lanzaboote.nixosModules.lanzaboote];

  boot = {
    lanzaboote = {
      enable = true;
      pkiBundle = "/var/lib/sbctl";
    };

    loader.systemd-boot.enable = false;
  };
}
