{
  config,
  lib,
  osConfig,
  ...
}: let
  enabled =
    config.home.opts.tier.work.enabled
    && osConfig.nixos.opts.wm.niri.enabled;
in
  lib.mkIf enabled {
    programs.niri.settings.environment = with config.home.opts.apps; {
      BROWSER = browser.exe;
      CLUTTER_BACKEND = "wayland";
      DISABLE_QT5_COMPAT = "0";
      DISABLE_QT_COMPAT = "0";
      EDITOR = term-text.which; # stylix compatibility
      ELECTRON_OZONE_PLATFORM_HINT = "auto";
      GDK_SCALE = "1";
      MOZ_ENABLE_WAYLAND = "1";
      NIXOS_OZONE_WL = "1";
      QT_AUTO_SCREEN_SCALE_FACTOR = "1";
      QT_IM_MODULE = "wayland";
      QT_QPA_PLATFORM = "wayland;xcb";
      QT_QPA_PLATFORMTHEME = "qt6ct";
      QT_SCALE_FACTOR = "1";
      QT_WAYLAND_DISABLE_WINDOWDECORATION = "1";
      SDL_VIDEODRIVER = "wayland";
      SHELL = shell.exe;
      SOPS_EDITOR = term-text.which; # stylix again
      TERMINAL = terminal.exe;
      VISUAL = text.exe;
      _JAVA_AWT_WM_NONREPARENTING = "1";
    };

    fonts.fontconfig.enable = true;

    xdg = {
      configFile = {
        "electron-flags.conf".text = ''
          --ozone-platform-hint=wayland
          --ozone-platform=wayland
        '';
      };
      userDirs.setSessionVariables = true;
    };
  }
