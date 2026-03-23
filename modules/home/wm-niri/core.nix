{
  flake,
  inputs,
  ...
}: {
  imports = with flake.modules.home; [
    inputs.niri-flake.homeModules.niri
    niriSuite
    swayidle
    swaylock
  ];
}
