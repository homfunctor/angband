{
  inputs,
  pkgs,
  ...
}: {
  environment.systemPackages = with pkgs; [
    gcc
    rust-bin.stable.latest.default
  ];

  nixpkgs.overlays = [inputs.rust-overlay.overlays.default];
}
