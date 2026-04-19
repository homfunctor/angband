{
  config,
  lib,
  osConfig,
  ...
}: let
  enabled =
    config.home.opts.tier.niceTTY.enabled
    && osConfig.nixos.opts.stylix.enabled;
in
  lib.mkIf enabled {
    home.opts = {
      nvim.enabled = true;

      stylix.targets.nixvim = {
        enable = true;
        plugin = "base16-nvim";
        transparentBackground = {
          main = true;
          signColumn = true;
        };
      };
    };
  }
