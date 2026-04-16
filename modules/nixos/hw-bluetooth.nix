# imported by hosts/<host>/settings/hardware.nix
{
  config,
  flake,
  pkgs,
  ...
}:
flake.lib.reqNTier config "work" {
  environment.systemPackages = [pkgs.blueman];

  hardware.bluetooth = {
    enable = true;
    powerOnBoot = true;
  };

  services.blueman.enable = true;
}
