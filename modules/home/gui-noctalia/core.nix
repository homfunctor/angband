{
  config,
  flake,
  inputs,
  lib,
  osConfig,
  pkgs,
  ...
}: let
  inherit (config.home.opts) userName;

  noctExe = lib.getExe osConfig.nixos.opts.gui.noct.pkg;
  noctCmd = cmd: [noctExe "ipc" "call"] ++ (flake.lib.splitArg cmd);
in {
  imports = [inputs.noctalia.homeModules.default];

  programs = lib.mkIf config.home.opts.tier.work.enabled {
    niri.settings.spawn-at-startup = [
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

    noctalia-shell = {
      enable = true;
      package = osConfig.nixos.opts.gui.noct.pkg;

      settings =
        {
          general = {
            allowPanelsOnScreenWithoutBar = true;
            avatarImage = "${inputs.utumno}/assets/${userName}.png";
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
            shadowDirection = "bottom_left";
            shadowOffsetX = 2;
            shadowOffsetY = 3;
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
            panelBackgroundOpacity = opacity.desktop;
            panelsAttachedToBar = true;
            settingsPanelAttachToBar = true;
            tooltipsEnabled = true;
          };
        }
        // osConfig.nixos.opts.gui.noct.misc;
    };
  };
}
