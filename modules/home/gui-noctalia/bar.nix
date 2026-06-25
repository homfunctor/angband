{
  config,
  flake,
  inputs,
  osConfig,
  ...
}: let
  inherit (osConfig.nixos.opts.gui) noctalia;
in {
  imports = [
    # provides location information
    inputs.utumno.homeModules.gui-doxtalia
  ];

  programs = flake.lib.reqHTier config "work" {
    noctalia-shell.settings = {
      bar = {
        inherit (noctalia.bar) widgets;

        barType = "simple";
        density = "comfortable";
        exclusive = true;
        floating = false;
        marginHorizontal = 0.2;
        marginVertical = 0.1;
        outerCorners = false;
        position = "top";
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
