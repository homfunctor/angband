{
  config,
  flake,
  lib,
  pkgs,
  ...
}: let
  inherit (config.home) homeDirectory;
  inherit (config.home.opts) apps tier;
  inherit (flake.lib) splitArg;
  inherit (lib) getExe mkIf;
in
  mkIf tier.work.enabled {
    programs.niri.settings = {
      binds = with config.lib.niri.actions; {
        # applications
        "Mod+E".action.spawn =
          [apps.directory.exe]
          ++ (splitArg apps.directory.args);
        "Mod+Shift+E".action.spawn =
          [apps.terminal.exe]
          ++ (splitArg (getExe pkgs.yazi))
          ++ ["${homeDirectory}/angband"];

        "Mod+W".action.spawn = apps.terminal.exe;
        "Mod+Shift+W".action.spawn = [
          apps.terminal.exe
          "${homeDirectory}/angband"
        ];
        "Mod+Ctrl+Shift+W".action.spawn = [
          apps.terminal.exe
          (getExe pkgs.yazi)
          "${homeDirectory}/Work"
        ];

        "Mod+O".action = toggle-overview;

        # window management
        "Mod+Q".action = close-window;
        "Mod+F".action = maximize-column;
        "Mod+Shift+F".action = fullscreen-window;
        "Mod+S".action = switch-preset-column-width;
        "Mod+T".action = toggle-window-floating;

        "Mod+C".action = consume-or-expel-window-right;
        "Mod+D".action = consume-or-expel-window-left;

        # window focus and movement
        "Mod+H".action = focus-column-left;
        "Mod+L".action = focus-column-right;
        "Mod+J".action = focus-window-down;
        "Mod+K".action = focus-window-up;
        "Mod+Shift+H".action = move-column-left;
        "Mod+Shift+L".action = move-column-right;
        "Mod+Shift+K".action = move-column-to-workspace-up;
        "Mod+Shift+J".action = move-column-to-workspace-down;

        "Mod+Left".action = focus-column-left;
        "Mod+Right".action = focus-column-right;
        "Mod+Down".action = focus-window-down;
        "Mod+Up".action = focus-window-up;
        "Mod+Shift+Left".action = move-column-left;
        "Mod+Shift+Right".action = move-column-right;
        "Mod+Shift+Down".action = move-column-to-workspace-up;
        "Mod+Shift+Up".action = move-column-to-workspace-down;

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
        "Mod+Ctrl+1".action.move-window-to-workspace = [{focus = false;} "1"];
        "Mod+Ctrl+2".action.move-window-to-workspace = [{focus = false;} "2"];
        "Mod+Ctrl+3".action.move-window-to-workspace = [{focus = false;} "3"];
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
