# imported by hosts/<host>/settings/hardware.nix
{
  config,
  flake,
  pkgs,
  ...
}:
flake.lib.reqNTier config "work" {
  environment.systemPackages = [pkgs.simple-scan];

  hardware.sane.enable = true;

  services.printing = {
    enable = true;
    drivers = with pkgs; [
      cnijfilter2
    ];
  };
}
