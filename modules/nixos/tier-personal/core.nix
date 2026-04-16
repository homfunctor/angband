# imported by hosts/<host>/settings/core.nix
{flake, ...}: {
  imports = with flake.modules.nixos; [
    fcitx
    gaming
    torrenting
  ];

  nixos.opts.tier.personal.enabled = true;
}
