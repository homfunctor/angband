# imported by hosts/<host>/users/<user>/settings/core.nix
{flake, ...}: {
  imports = with flake.modules.home; [
    niriSuite
    swayidle
    swaylock
  ];
}
