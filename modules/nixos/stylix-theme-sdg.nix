{
  config,
  lib,
  ...
}: {
  config = let
    cfg =
      config.nixos.opts.stylix.enable
      && config.nixos.opts.tier.niceTTY.enabled;
  in
    lib.mkIf cfg {
      stylix.base16Scheme = {
        base00 = "#000000";
        base01 = "#1E2B38";
        base02 = "#31475A";
        base03 = "#4A677D";
        base04 = "#6D8BA3";
        base05 = "#A8C6D9";
        base06 = "#C9DDEB";
        base07 = "#E0EDF5";
        base08 = "#3FAFD6";
        base09 = "#4A6B80";
        base0A = "#6B9DB3";
        base0B = "#7AA8BF";
        base0C = "#3A5D6E";
        base0D = "#4D7E9E";
        base0E = "#5FB8D9";
        base0F = "#2E7A96";
        author = "homfunctor";
        scheme = "Sorcier des Glaces";
        slug = "sorcier-des-glaces";
      };
    };
}
