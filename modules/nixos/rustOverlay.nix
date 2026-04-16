# imported by hosts/<host>/settings/core.nix
{
  config,
  flake,
  inputs,
  pkgs,
  ...
}:
flake.lib.reqNTier config "niceTTY" {
  environment.systemPackages = with pkgs; [
    gcc
    rust-bin.stable.latest.default
  ];

  nixpkgs.overlays = [inputs.rust-overlay.overlays.default];
}
