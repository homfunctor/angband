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
      base03 = "#72727A";
      base04 = "#9A9AA8";
      base05 = "#B0B0B0";
      base06 = "#D3D5D7";
      base07 = "#7E9197";
      base08 = "#989498";
      base09 = "#505067";
      base0A = "#C9C5C9";
      base0B = "#858381";
      base0C = "#687183";
      base0D = "#7E7E7E";
      base0E = "#899A9F";
      base0F = "#474A50";
      author = "homfunctor";
      scheme = "Warning";
      slug = "warning";
    };
  }
