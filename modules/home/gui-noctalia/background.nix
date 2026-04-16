{
  config,
  inputs,
  lib,
  osConfig,
  ...
}: let
  display = osConfig.nixos.opts.display // config.home.opts.display;
  genericBG = "${inputs.utumno}/assets/base.png";

  enabled =
    config.home.opts.tier.work.enabled
    && osConfig.nixos.opts.gui.noct.enable;
in
  lib.mkIf enabled {
    programs.noctalia-shell.settings.wallpaper = {
      enabled = true;
      transitionType = "none";
    };

    home.file.".cache/noctalia/wallpapers.json" = lib.mkForce {
      text = builtins.toJSON {
        # separated to handle EXTernal/EXTra monitors
        wallpapers = with display; let
          mainMonitors = lib.listToAttrs (
            lib.zipListsWith (
              m: b: {
                name = m;
                value = b;
              }
            )
            monitors
            backgrounds
          );

          extraMonitors = lib.listToAttrs (
            map (
              m: {
                name = m;
                value = genericBG;
              }
            )
            extMonitors
          );
        in
          mainMonitors // extraMonitors;
      };
    };
  }
