# {flake, ...}: {imports = flake.lib.genImportsFromDir ./.;}
# temp: manual imports
{
  imports = [
    ./core.nix
  ];
}
