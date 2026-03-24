{
  config,
  lib,
  osConfig,
  ...
}:
lib.mkIf (config.home.opts.tier.work.enabled
  && osConfig.nixos.opts.stylix.enable) {
  stylix = {
    inherit (config.home.opts.stylix) targets;
  };
}
