{
  config,
  lib,
  osConfig,
  ...
}: let
  cfg = osConfig.nixos.opts.stylix.enable && config.home.opts.tier.niceTTY.enabled;
in
  lib.mkIf cfg {
    stylix = {
      enable = cfg;
      autoEnable = cfg;
      inherit (config.home.opts.stylix) targets;
    };
  }
