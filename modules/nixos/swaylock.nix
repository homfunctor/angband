{
  config,
  lib,
  ...
}:
lib.mkIf config.nixos.opts.tier.work.enabled {
  security.pam.services.swaylock.text = "auth include login";
}
