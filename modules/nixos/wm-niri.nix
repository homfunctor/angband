{
  config,
  flake,
  inputs,
  ...
}: {
  imports = with flake.modules.nixos; [
    niriSuite
    swaylock
  ];

  config = flake.lib.reqNTier config "work" {
    nixpkgs.overlays = [inputs.niri-flake.overlays.niri];

    programs.niri = {
      enable = true;
      package = config.nixos.opts.wm.niri.pkg;
    };
  };
}
