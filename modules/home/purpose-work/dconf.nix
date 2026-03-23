{config, ...}: {
  dconf = {
    enable = true;

    settings = {
      "org/freedesktop/appearance".color-scheme = 1;

      "org/gnome/desktop/interface".color-scheme = "prefer-dark";
      "org/gnome/desktop/privacy" = {
        remember-app-usage = false;
        remember-recent-files = false;
      };

      "org/gtk/gtk4/settings/file-chooser".sort-directories-first = true;
      "org/gtk/settings/file-chooser" = {
        date-format = "with-time";
        show-hidden = false;
        sort-column = "name";
        sort-directories-first = true;
        sort-order = "ascending";
        type-format = "category";
      };

      # terminal for nemo
      "org/cinnamon/desktop/applications/terminal" = {
        exec = config.home.opts.apps.terminal.exe;
      };
    };
  };
}
