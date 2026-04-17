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
    programs.seahorse.enable = true;
    services.udisks2.enable = true;
  }
