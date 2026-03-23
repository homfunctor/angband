{
  config,
  lib,
  ...
}: {
  networking = {
    inherit (config.nixos.opts) hostName;

    firewall.enable = true;

    networkmanager = {
      enable = true;
      dns = "systemd-resolved";
    };

    useDHCP = lib.mkDefault true;
  };

  services = {
    openssh = {
      enable = true;
      settings.UseDns = true;
    };

    resolved.enable = true;
  };
}
