# imported by hosts/<host>/users/<user>/home-configuration.nix
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
    stylix = {
      inherit (config.home.opts.stylix) targets;
      enable = true;
      autoEnable = true;
      enableReleaseChecks = false;
    };
  }
