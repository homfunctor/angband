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

  nixpkgs.overlays = [
    inputs.niri-flake.overlays.niri
  ];

  programs.niri = {
    enable = true;
    package = config.nixos.opts.wm.niri.pkg;
  };
}
