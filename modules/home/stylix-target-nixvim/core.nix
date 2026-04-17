{
  config,
  lib,
  osConfig,
  ...
}: let
  enabled =
    config.home.opts.nvim.enable
    && config.home.opts.tier.niceTTY.enabled
    && osConfig.nixos.opts.stylix.enable;
in
  lib.mkIf enabled {
    home.opts.stylix.targets.nixvim = {
      enable = true;
      plugin = "base16-nvim";
      transparentBackground = {
        main = true;
        signColumn = true;
      };
    };
  }
