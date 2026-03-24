{
  config,
  flake,
  lib,
  ...
}: {
  imports = with flake.modules.home; [
    niriSuite
    swayidle
    swaylock
  ];
}
