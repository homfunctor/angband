# imported by tier-niceTTY
# todo: settings
{
  config,
  flake,
  ...
}:
flake.lib.reqHTier config "work"
{
  programs.zoxide.enable = true;
}
