{
  config,
  flake,
  inputs,
  lib,
  ...
}: {
  imports = with flake.modules.nixos; [
    niriSuite
    swaylock
  ];

  config = lib.mkIf config.nixos.opts.tier.work.enabled {
    nixpkgs.overlays = [inputs.niri-flake.overlays.niri];

    programs.niri = {
      enable = true;
      package = config.nixos.opts.wm.niri.pkg;
    };
  };
}
