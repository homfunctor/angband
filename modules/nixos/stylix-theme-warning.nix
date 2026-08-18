# imported by hosts/<host>/settings/stylix.nix
{
  config,
  lib,
  ...
}: let
  enabled =
    config.nixos.opts.stylix.enabled
    && config.nixos.opts.tier.niceTTY.enabled;
in
  lib.mkIf enabled {
    stylix.base16Scheme = {
      base00 = "#000000";
      base01 = "#1B1B20";
      base02 = "#32323C";
      base03 = "#4D4D5C";
      base04 = "#787884";
      base05 = "#9E9EAA";
      base06 = "#C6C6CE";
      base07 = "#585866";
      base08 = "#A7A9C5";
      base09 = "#878684";
      base0A = "#AEAEB8";
      base0B = "#6A6A75";
      base0C = "#747487";
      base0D = "#898995";
      base0E = "#A6A6B1";
      base0F = "#5F5F71";
      author = "homfunctor";
      scheme = "Warning";
      slug = "warning";
    };
  }
