{
  hostName,
  lib,
  ...
}: {
  networking = {
    inherit hostName;

    firewall.enable = true;
    networkmanager.enable = true;
    useDHCP = lib.mkDefault true;
  };

  services.openssh = {
    enable = true;
    settings.UseDns = true;
  };
}
