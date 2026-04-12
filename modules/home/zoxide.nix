{
  config,
  flake,
  ...
}:
flake.lib.reqHTier config "work"
{
  programs.zoxide.enable = true;
}
