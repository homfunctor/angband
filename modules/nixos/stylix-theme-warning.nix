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
      base06 = "#4E4E4E";
      base07 = "#CDCDCD";
      base08 = "#90909E";
      base09 = "#4D4D4D";
      base0A = "#A08040";
      base0B = "#898781";
      base0C = "#D4D4FE";
      base0D = "#838C88";
      base0E = "#505067";
      base0F = "#9AACBC";
      author = "homfunctor";
      scheme = "Warning";
      slug = "warning";
    };
  }
