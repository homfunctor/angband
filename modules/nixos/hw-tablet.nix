# todo: check on multi-user bug (problematic file in /tmp)
{
  config,
  lib,
  ...
}:
lib.mkIf config.nixos.opts.tier.work.enabled {
  hardware.opentabletdriver = {
    enable = true;
    daemon.enable = true;
  };
}
