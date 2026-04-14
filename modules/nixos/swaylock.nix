# imported by wm-niri
{
  config,
  flake,
  ...
}:
flake.lib.reqNTier config "work" {
  security.pam.services.swaylock.text = "auth include login";
}
