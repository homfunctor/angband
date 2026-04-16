# imported by hosts/<host>/users/<user>/home-configuration.nix
{
  config,
  lib,
  osConfig,
  ...
}: let
  enabled =
    config.home.opts.tier.niceTTY.enabled
    && osConfig.nixos.opts.stylix.enable;
in
  lib.mkIf enabled {
    stylix = {
      enable = enabled;
      autoEnable = enabled;
      inherit (config.home.opts.stylix) targets;
    };
  }
