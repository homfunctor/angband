{
  config,
  lib,
  ...
}:
lib.mkIf config.nixos.opts.tier.work.enabled {
  programs.seahorse.enable = true;
  services.udisks2.enable = true;
}
