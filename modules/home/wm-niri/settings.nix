{
  config,
  lib,
  osConfig,
  ...
}: let
  display = osConfig.nixos.opts.display // config.home.opts.display;
  inherit
    (lib)
    concatLists
    elemAt
    genList
    length
    listToAttrs
    mkIf
    range
    zipListsWith
    ;
in
  mkIf config.home.opts.tier.work.enabled {
    programs.niri.settings = with display; {
      hotkey-overlay.skip-at-startup = true;
      gestures.hot-corners.enable = false;
      input = {
        keyboard.numlock = true;
        mouse.accel-profile = "flat";
        warp-mouse-to-focus.enable = true;
      };

      layout.focus-ring.enable = false;

      outputs = listToAttrs (
        zipListsWith (m: p: {
          name = m;
          value.position = {
            x = elemAt p 0;
            y = elemAt p 1;
          };
        })
        monitors
        positions
      );

      overview = {
        workspace-shadow.enable = false;
        backdrop-color = "transparent";
      };

      prefer-no-csd = true;

      screenshot-path = let
        screenshotDir = "${config.xdg.userDirs.pictures}/Screenshots";
      in "${screenshotDir}/screenshot-%Y-%m-%d-%H:%M:%S.png";

      # i'm very particular about my workspaces
      workspaces = let
        num = range 1 ((length monitors) * numWSPerD);
        mon =
          monitors
          ++ (
            concatLists (genList (_: monitors) (numWSPerD - 1))
          );
      in
        listToAttrs (zipListsWith (n: m: {
            name = toString n;
            value.open-on-output = m;
          })
          num
          mon);
    };
  }
