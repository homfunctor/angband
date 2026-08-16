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
      base01 = "#0F0F12";
      base02 = "#1E1E24";
      base03 = "#383842";
      base04 = "#787884";
      base05 = "#9E9EAA";
      base06 = "#C6C6CE";
      base07 = "#585866";
      base08 = "#6982A5";
      base09 = "#878684";
      base0A = "#AEAEB8";
      base0B = "#6A6A76";
      base0C = "#706170";
      base0D = "#8A8A96";
      base0E = "#9696A2";
      base0F = "#3E3E4A";
      author = "homfunctor";
      scheme = "Warning";
      slug = "warning";
    };
  }
