# imported by hosts/<host>/settings/core.nix
{
  config,
  flake,
  inputs,
  pkgs,
  ...
}: {
  imports = with flake.modules.nixos; [
    dm-gdm
    niriSuite
    swaylock
  ];

  config = flake.lib.reqNTier config "work" {
    nixos.opts.wm.niri.enabled = true;

    nixpkgs.overlays = [inputs.niri-flake.overlays.niri];

    programs.niri = {
      enable = true;
      package = pkgs.niri;
    };

    services.displayManager.defaultSession = "niri";
  };
}
