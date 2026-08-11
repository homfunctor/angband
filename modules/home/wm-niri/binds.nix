# todo: add more
{
  config,
  flake,
  lib,
  osConfig,
  ...
}: let
  inherit (config.home) homeDirectory;
  inherit (config.home.opts) apps tier;
  inherit (flake.lib) splitArg;
  inherit (lib) mkIf;

  enabled =
    tier.work.enabled
    && osConfig.nixos.opts.wm.niri.enabled;
in
  mkIf enabled {
    programs.niri.settings = {
      binds = with config.lib.niri.actions; {
        # applications
        "Mod+N".action.spawn =
          [apps.directory.exe]
          ++ (splitArg apps.directory.args);

        "Mod+W".action.spawn = apps.terminal.exe;
        "Mod+Shift+W".action.spawn = [
          apps.terminal.exe
          "${homeDirectory}/angband"
        ];
        "Mod+Ctrl+W".action.spawn = [
          apps.terminal.exe
          "${homeDirectory}/Work"
        ];

        "Mod+O".action = toggle-overview;

        # window management
        "Mod+Q".action = close-window;
        "Mod+S".action = switch-preset-column-width;
        "Mod+Shift+S".action = maximize-column;
        "Mod+Ctrl+S".action = fullscreen-window;
        "Mod+T".action = toggle-window-floating;

        "Mod+C".action = consume-or-expel-window-left;
        "Mod+D".action = consume-or-expel-window-right;

        # window focus and movement
        "Mod+A".action = focus-column-left;
        "Mod+F".action = focus-column-right;

        "Mod+Ctrl+A".action = focus-window-down;
        "Mod+Ctrl+F".action = focus-window-up;

        "Mod+Shift+A".action = move-column-left;
        "Mod+Shift+F".action = move-column-right;

        "Mod+Left".action = focus-column-left;
        "Mod+Right".action = focus-column-right;

        "Mod+Shift+Left".action = move-column-left;
        "Mod+Shift+Right".action = move-column-right;

        # screenshots
        "Print".action.screenshot.show-pointer = false;

        # workspaces
        "Mod+1".action.focus-workspace = "1";
        "Mod+2".action.focus-workspace = "2";
        "Mod+3".action.focus-workspace = "3";
        "Mod+Shift+1".action.focus-workspace = "4";
        "Mod+Shift+2".action.focus-workspace = "5";
        "Mod+Shift+3".action.focus-workspace = "6";

        # moving windows to specific workspaces
        "Mod+Ctrl+1".action.move-window-to-workspace = [
          {focus = false;}
          "1"
        ];
        "Mod+Ctrl+2".action.move-window-to-workspace = [
          {focus = false;}
          "2"
        ];
        "Mod+Ctrl+3".action.move-window-to-workspace = [
          {focus = false;}
          "3"
        ];
        "Mod+Ctrl+Shift+1".action.move-window-to-workspace = [
          {focus = false;}
          "4"
        ];
        "Mod+Ctrl+Shift+2".action.move-window-to-workspace = [
          {focus = false;}
          "5"
        ];
        "Mod+Ctrl+Shift+3".action.move-window-to-workspace = [
          {focus = false;}
          "6"
        ];
      };

      switch-events = {
        # todo
        # lid-close
        # lid-open
      };
    };
  }
