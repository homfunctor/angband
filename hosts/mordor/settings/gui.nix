# per-host settings that are used by hm modules
{
  nixos.opts.gui.noctalia = {
    # inherited within bar as widgets
    bar.widgets = {
      left = [
        {
          id = "ControlCenter";
          colorizeSystemIcon = "error";
          enableColorization = true;
          useDistroLogo = true;
        }
        {
          id = "Workspace";
          colorizeIcons = true;
          enableScrollWheel = true;
          hideUnoccupied = false;
          labelMode = "none";
          showApplications = true;
        }
      ];

      center = [
        {
          id = "Clock";
          formatHorizontal = "ddd MMM d h:mm AP";
          usePrimaryColor = true;
        }
      ];

      right = [
        {
          id = "Tray";
          colorizeIcons = false;
          drawerEnabled = false;
          hidePassive = false;
        }
        {
          id = "Volume";
          displayMode = "alwaysShow";
        }
        {
          id = "Microphone";
          displayMode = "alwaysShow";
        }
        {
          id = "NotificationHistory";
          hideWhenZero = false;
          showUnreadBadge = true;
        }
        {
          id = "SessionMenu";
          usePrimaryColor = true;
        }
      ];
    };

    controlCenter = {
      # inherited
      cards = [
        {
          id = "profile-card";
          enabled = true;
        }
        {
          id = "shortcuts-card";
          enabled = true;
        }
        {
          id = "audio-card";
          enabled = true;
        }
        {
          id = "weather-card";
          enabled = false;
        }
        {
          id = "media-sysmon-card";
          enabled = true;
        }
      ];
      # inherited
      shortcuts = {
        left = [];
        right = [];
      };
    };

    # misc to adjoin to noctalia-shell.settings
    misc.network.wifiEnabled = false;
  };
}
