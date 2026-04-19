# imported by wm-niri
# but this module works with any wm
{
  config,
  flake,
  ...
}:
flake.lib.reqNTier config "work" {
  security.pam.services.swaylock.text = "auth include login";
}
