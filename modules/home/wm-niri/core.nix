{flake, ...}: {
  imports = with flake.modules.home; [
    niriSuite
    swayidle
    swaylock
  ];
}
