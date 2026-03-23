{flake, ...}: {
  imports = with flake.modules.nixos; [
    hw-audio
    hw-graphics
  ];
}
