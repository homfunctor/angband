{flake, ...}: {
  imports = with flake.modules.nixos; [
    lixStable
  ];
}
