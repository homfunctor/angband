{
  config,
  flake,
  inputs,
  lib,
  osConfig,
  ...
}: let
  display = config.home.opts.display // osConfig.nixos.opts.display;
  genericBG = "${inputs.utumno}/assets/base.png";
in
  flake.lib.reqHTier config "work" {
    programs.noctalia-shell.settings.wallpaper = {
      enabled = true;
      skipStartupTransition = false;
      transitionType = "stripes";
    };

    home.file.".cache/noctalia/wallpapers.json" = lib.mkForce {
      text = builtins.toJSON {
        # separated to handle EXTernal/EXTra monitors
        wallpapers = with display; let
          mainMonitors =
            lib.listToAttrs
            (lib.zipListsWith
              (m: b: {
                name = m;
                value = b;
              })
              monitors
              backgrounds);

          extraMonitors =
            lib.listToAttrs
            (map
              (m: {
                name = m;
                value = genericBG;
              })
              extMonitors);
        in
          mainMonitors // extraMonitors;
      };
    };
  }
