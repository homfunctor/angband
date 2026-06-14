# imported by hosts/<host>/users/<user>/settings/core.nix
{
  config,
  flake,
  inputs,
  lib,
  osConfig,
  perSystem,
  pkgs,
  ...
}: let
  inherit (lib) mkIf;
  hmOpts = config.home.opts;
  nixOpts = osConfig.nixos.opts;

  noctExe = lib.getExe osConfig.nixos.opts.gui.noctalia.pkg;
  noctCmd = cmd: [noctExe "ipc" "call"] ++ (flake.lib.splitArg cmd);
in
  flake.lib.reqHTier config "work" {
    home.opts.gui.noctalia.enabled = true;

    programs = {
      # niri starts noctalia
      niri = mkIf nixOpts.wm.niri.enabled {
        settings.spawn-at-startup = [
          {
            command = [
              noctExe
              "--no-duplicate"
            ];
          }
          {
            command = noctCmd "volume muteInput";
          }
        ];
      };

      noctalia = {
        enable = true;
        package = perSystem.noctalia.default;

        settings =
          {
            general = {
              allowPanelsOnScreenWithoutBar = true;
              avatarImage = "${inputs.utumno}/assets/${hmOpts.userName}.png";
              dimmerOpacity = 0;
              forceBlackScreenCorners = false;
              showScreenCorners = false;

              boxRadiusRatio = 0;
              iRadiusRatio = 0;
              radiusRatio = 0;
              scaleRatio = 1;
              screenRadiusRatio = 0;

              animationDisabled = false;
              animationSpeed = 1;
              enableShadows = true;
              shadowDirection = "bottom_right";
              shadowOffsetX = 2;
              shadowOffsetY = 3;
              telemetryEnabled = false;
            };

            audio = {
              externalMixer = "${lib.getExe pkgs.pwvucontrol}";
              preferredPlayer = config.home.opts.apps.audio.exe;
            };

            dock.enabled = false;

            sessionMenu.showHeader = false;

            ui = with config.stylix; {
              boxBorderEnabled = true;
              fontDefault = fonts.sansSerif.name;
              fontDefaultScale = 1.25;
              fontFixed = fonts.monospace.name;
              fontFixedScale = 1.25;
              panelBackgroundOpacity = 1;
              panelsAttachedToBar = true;
              scrollbarAlwaysVisible = true;
              settingsPanelAttachToBar = false;
              settingsPanelMode = "window";
              settingsPanelSideBarCardStyle = false;
              tooltipsEnabled = true;
              translucentWidgets = false;
            };
          }
          // nixOpts.gui.noctalia.misc;
      };
    };
  }
