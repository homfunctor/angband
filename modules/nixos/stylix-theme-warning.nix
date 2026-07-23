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
      base03 = "#5F5F66";
      base04 = "#9A9AA8";
      base05 = "#B0B0B0";
      base06 = "#C0D0EA";
      base07 = "#A08040";
      base08 = "#9898C8";
      base09 = "#505067";
      base0A = "#C9C5C9";
      base0B = "#858381";
      base0C = "#868F9F";
      base0D = "#606080";
      base0E = "#B8954F";
      base0F = "#474A50";
      author = "homfunctor";
      scheme = "Warning";
      slug = "warning";
    };
  }
