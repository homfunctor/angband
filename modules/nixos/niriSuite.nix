{
  config,
  lib,
  ...
}:
lib.mkIf config.nixos.opts.work.enabled {
  programs.seahorse.enable = true;
  services.udisks2.enable = true;
}
