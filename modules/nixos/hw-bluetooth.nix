{
  config,
  lib,
  pkgs,
  ...
}:
lib.mkIf config.nixos.opts.tier.work.enabled {
  environment.systemPackages = [pkgs.blueman];

  hardware.bluetooth = {
    enable = true;
    powerOnBoot = true;
  };

  services.blueman.enable = true;
}
