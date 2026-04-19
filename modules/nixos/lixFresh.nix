# imported by hosts/<host>/settings/core.nix
# will compile newest version of lix
{
  config,
  inputs,
  ...
}: {
  imports = [inputs.lix-module.nixosModules.default];

  lix.enable = config.nixos.opts.tier.niceTTY.enabled;
}
