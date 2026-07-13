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
      base01 = "#1E1E1E";
      base02 = "#464646";
      base03 = "#6A8CAA";
      base04 = "#DCDCDC";
      base05 = "#CACACA";
      base06 = "#AFAFAF";
      base07 = "#446B85";
      base08 = "#D8E0E8";
      base09 = "#C5CBCF";
      base0A = "#8080A0";
      base0B = "#EEEEEE";
      base0C = "#9E9E9E";
      base0D = "#839CC7";
      base0E = "#9AACBC";
      base0F = "#4A5A6A";
      author = "homfunctor";
      scheme = "Warning";
      slug = "warning";
    };
  }
