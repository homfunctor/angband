# imported by hosts/<host>/users/<user>/settings/core.nix
{
  config,
  flake,
  ...
}:
flake.lib.reqHTier config "niceTTY" {
  home.opts.nvim.enabled = true;

  programs = {
    neovide.enable = true;
    nixvim.enable = true;
  };
}
