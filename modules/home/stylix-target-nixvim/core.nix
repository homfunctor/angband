{
  config,
  lib,
  osConfig,
  ...
}: let
  enabled =
    osConfig.nixos.opts.stylix.enable
    && config.home.opts.tier.niceTTY.enabled;
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
