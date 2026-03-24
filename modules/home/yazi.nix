{pkgs, ...}: {
  programs.yazi = {
    enable = true;
    plugins = {
      inherit
        (pkgs.yaziPlugins)
        full-border
        mediainfo
        mount
        starship
        ;
    };
    settings.manager = {
      ratio = [1 2 4];
      show_hidden = true;
      show_symlink = true;
      sort_by = "alphabetical";
      sort_dir_first = true;
      sort_sensitive = false;
    };
  };
}
