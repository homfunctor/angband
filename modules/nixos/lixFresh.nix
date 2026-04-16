# imported by hosts/<host>/settings/core.nix
# mutually exclusive with lixStable
{
  config,
  inputs,
  ...
}: {
  imports = [inputs.lix-module.nixosModules.default];

  lix.enable = config.nixos.opts.tier.niceTTY.enabled;
}
