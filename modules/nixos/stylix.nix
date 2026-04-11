{
  config,
  flake,
  inputs,
  pkgs,
  ...
}:
flake.lib.reqNTier config "niceTTY" {
  stylix = {
    enable = true;
    autoEnable = true;

    inherit (config.nixos.opts.stylix) opacity;

    # useless and annoying
    enableReleaseChecks = false;

    fonts = {
      emoji = {
        name = "Noto Color Emoji";
        package = pkgs.noto-fonts-color-emoji;
      };
      sizes = config.nixos.opts.stylix.fontSizes;
    };

    image = "${inputs.utumno}/assets/base.png";
    polarity = "dark";
  };
}
