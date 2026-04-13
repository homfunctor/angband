{
  config,
  lib,
  osConfig,
  ...
}: let
  enabled = osConfig.nixos.opts.stylix.enable && config.home.opts.tier.niceTTY.enabled;
in
  lib.mkIf enabled {
    stylix = {
      enable = enabled;
      autoEnable = enabled;
      inherit (config.home.opts.stylix) targets;
    };
  }
