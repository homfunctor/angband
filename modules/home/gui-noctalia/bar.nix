{
  config,
  inputs,
  lib,
  osConfig,
  ...
}: let
  inherit (osConfig.nixos.opts.gui) noct;

  enabled = config.home.opts.tier.work.enabled && noct.enable;
in {
  imports = [inputs.utumno.homeModules.gui-doxtalia];

  programs = lib.mkIf enabled {
    noctalia-shell.settings = {
      bar = {
        inherit (noct.bar) widgets;

        barType = "simple";
        compactMode = false;
        density = "comfortable";
        exclusive = true;
        floating = false;
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
        inherit (noct.controlCenter) cards shortcuts;
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
