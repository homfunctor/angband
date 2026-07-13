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
      base01 = "#1A1A1A";
      base02 = "#3A3A4A";
      base03 = "#5A6A7A";
      base04 = "#6A7A8A";
      base05 = "#7B8B9B";
      base06 = "#B8B8B8";
      base07 = "#D8D8D8";
      base08 = "#D8E0E8";
      base09 = "#484848";
      base0A = "#5A6A7A";
      base0B = "#4A5A6A";
      base0C = "#3A4A5A";
      base0D = "#6A8AAA";
      base0E = "#9AACBC";
      base0F = "#3A8AAA";
      author = "homfunctor";
      scheme = "Warning";
      slug = "warning";
    };
  }
