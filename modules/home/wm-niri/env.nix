{
  config,
  inputs,
  ...
}: let
  inherit (config.home.opts) apps;
in {
  imports = [inputs.utumno.modules.home.extraSessionVars];
  programs.niri.settings.environment = {
    BROWSER = apps.browser.exe;
    CLUTTER_BACKEND = "wayland";
    DISABLE_QT5_COMPAT = "0";
    DISABLE_QT_COMPAT = "0";
    EDITOR = apps.term-text.exe;
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
    SHELL = apps.shell.exe;
    SOPS_EDITOR = apps.term-text.exe;
    TERMINAL = apps.terminal.exe;
    VISUAL = apps.text.exe;
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
