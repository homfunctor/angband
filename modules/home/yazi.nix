# imported by tier-work
# todo: settings
{
  programs.yazi = {
    enable = true;
    settings = {
      manager = {
        ratio = [1 2 4];
        show_hidden = true;
        show_symlink = true;
        sort_by = "alphabetical";
        sort_dir_first = true;
        sort_sensitive = false;
      };

      # $EDITOR directly referring to neovim in the nix store
      # causes a bug in yazi (freaks out about
      # ~/.config/nvim/init.lua requiring
      # base16-colosceheme). this fixes it
      opener.edit = [
        {
          run = "neovide %s";
          block = false;
          orphan = true;
        }
      ];
    };
  };
}
