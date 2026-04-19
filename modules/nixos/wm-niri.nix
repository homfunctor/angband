# imported by hosts/<host>/settings/core.nix
{
  config,
  flake,
  inputs,
  ...
}: {
  imports = with flake.modules.nixos; [
    dm-gdm
    niriSuite
    swaylock
  ];

  config = flake.lib.reqNTier config "work" {
    nixpkgs.overlays = [inputs.niri-flake.overlays.niri];

    nixos.opts.wm.niri.enabled = true;

    programs.niri = {
      enable = true;
      package = config.nixos.opts.wm.niri.pkg;
    };
  };
}
