{
  config,
  lib,
  osConfig,
  ...
}: let
  cfg = osConfig.nixos.opts.stylix.enable;
in
  lib.mkIf (config.home.opts.tier.work.enabled
    && cfg) {
    stylix = {
      enable = cfg;
      autoEnable = cfg;
      inherit (config.home.opts.stylix) targets;
    };
  }
