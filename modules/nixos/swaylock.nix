# imported by wm-niri
{
  config,
  flake,
  lib,
  ...
}: let
  enabled =
    config.nixos.opts.tier.work.enabled
    && config.nixos.opts.wm.niri.enable;
in
  lib.mkIf enabled {
    security.pam.services.swaylock.text = "auth include login";
  }
