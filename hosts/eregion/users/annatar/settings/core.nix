{
  flake,
  osConfig,
  ...
}: {
  imports = with flake.modules.home; [
    opts

    purpose-work

    LaTeX
    defaultApplications
    shell-fish-integration
    vivaldi
    workStuff
  ];

  home.opts = {
    userName = builtins.elemAt osConfig.nixos.opts.userNames 0;

    shellInt = {
      eza.enable = true;
      kitty.enable = true;
      nix-index.enable = true;
      starship.enable = true;
      yazi.enable = true;
      zoxide.enable = true;
    };
  };
}
