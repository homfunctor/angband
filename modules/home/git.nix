{
  programs.git = {
    enable = true;
    settings = {
      color.ui = "1";
      gpg.format = "ssh";
      init.defaultBranch = "main";
      pull.rebase = "false";
    };
  };
}
