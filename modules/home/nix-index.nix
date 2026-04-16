# imported by hosts/<host>/users/<user>/settings/core.nix
{
  config,
  flake,
  inputs,
  ...
}: {
  imports = [inputs.nix-index-database.homeModules.nix-index];

  programs = flake.lib.reqHTier config "work" {
    nix-index.enable = true;
  };
}
