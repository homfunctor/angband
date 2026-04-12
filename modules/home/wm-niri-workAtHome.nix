{
  config,
  flake,
  ...
}:
flake.lib.reqHTier config "work" {
  programs.niri.settings.layout = {
    border.width = 4;
    gaps = 0;
  };
}
