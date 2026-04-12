{
  config,
  flake,
  ...
}:
flake.lib.reqHTier config "personal" {
  programs.niri.settings.layout.gaps = 6;
}
