{
  programs.sioyek = {
    enable = true;

    # todo: settings
    config = {
      should_launch_new_window = "1";
    };
    bindings = {};
  };

  xdg.mimeApps = {
    associations.added."application/epub+zip" = "sioyek.desktop";
    defaultApplications."application/x-mobi8-ebook" = "sioyek.desktop";
  };
}
