{
  config,
  inputs,
  lib,
  osConfig,
  pkgs,
  ...
}:
lib.mkIf config.home.opts.tier.work.enabled {
  programs = {
    swaylock = {
      enable = true;
      settings = {
        image = lib.mkForce "${inputs.utumno}/assets/durinsgate.jpg";
        scaling = "fill";
        font =
          lib.mkIf osConfig.nixos.opts.stylix.enable
          config.stylix.fonts.sansSerif.name;
      };
    };

    # always enabled
    niri.settings.binds = with config.lib.niri.actions; {
      "Mod+Alt+L".action.spawn = lib.getExe pkgs.swaylock;
    };
  };
}
