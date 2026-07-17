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
      base01 = "#111111";
      base02 = "#333333";
      base03 = "#7A7A7A";
      base04 = "#949494";
      base05 = "#ACACAC";
      base06 = "#DEDEDE";
      base07 = "#CDCDCD";
      base08 = "#6C9CA0";
      base09 = "#57576E";
      base0A = "#404056";
      base0B = "#898781";
      base0C = "#4D4F4E";
      base0D = "#D4D4FE";
      base0E = "#839CC7";
      base0F = "#9AACBC";
      author = "homfunctor";
      scheme = "Warning";
      slug = "warning";
    };
  }
