# imported by hosts/<host>/settings/hardware.nix
# obviously assumes we're on a thinkpad t490
# or rather it thinks it is
#
# a pad
{inputs, ...}: {
  imports = [
    inputs.nixos-hardware.nixosModules.lenovo-thinkpad-t490
  ];
}
