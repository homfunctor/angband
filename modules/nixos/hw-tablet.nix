# todo: check on multi-user bug (problematic file in /tmp)
{
  config,
  flake,
  ...
}:
flake.lib.reqNTier config "work" {
  hardware.opentabletdriver = {
    enable = true;
    daemon.enable = true;
  };
}
