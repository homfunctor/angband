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
      base01 = "#131313";
      base02 = "#232323";
      base03 = "#7A7A7A";
      base04 = "#A0A0A0";
      base05 = "#8A8A96";
      base06 = "#4A4550";
      base07 = "#9A7838";
      base08 = "#C8C8C8";
      base09 = "#4D4D4D";
      base0A = "#4C4C60";
      base0B = "#858380";
      base0C = "#494949";
      base0D = "#74A0B8";
      base0E = "#855585";
      base0F = "#102A38";
      author = "homfunctor";
      scheme = "Warning";
      slug = "warning";
    };
  }
