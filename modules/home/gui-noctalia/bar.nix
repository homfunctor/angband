{
  config,
  flake,
  inputs,
  osConfig,
  ...
}: let
  inherit (osConfig.nixos.opts.gui) noctalia;
in {
  imports = [inputs.utumno.homeModules.gui-doxtalia];

  programs = flake.lib.reqHTier config "work" {
    noctalia-shell.settings = {
      bar = {
        inherit (noctalia.bar) widgets;

        barType = "simple";
        compactMode = false;
        density = "comfortable";
        exclusive = true;
        floating = false;
        outerCorners = false;
        position = "top";
        rightClickAction = "launcherPanel";
        rightClickFollowMouse = true;
        showCapsule = true;
        showOutline = true;
        transparent = false;
      };

      calendar.cards = [
        {
          id = "calendar-header-card";
          enabled = false;
        }
        {
          id = "calendar-month-card";
          enabled = true;
        }
        {
          id = "timer-card";
          enabled = false;
        }
        {
          id = "weather-card";
          enabled = true;
        }
      ];

      controlCenter = {
        inherit (noctalia.controlCenter) cards shortcuts;
        position = "close_to_bar_button";
        useErrorColor = true;
      };

      location = {
        showCalendarEvents = true;
        showCalendarWeather = true;
        showWeekNumberInCalendar = true;
        weatherEnabled = true;
        weatherShowEffects = true;
      };
    };
  };
}
