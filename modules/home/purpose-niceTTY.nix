{
  flake,
  pkgs,
  ...
}: {
  imports = with flake.modules.home; [
    purpose-minTTY

    neovim
    starship
    zoxide
  ];

  home = {
    opts.tier.niceTTY.enabled = true;

    packages = with pkgs; [
      alejandra
      deadnix
      erdtree
      killall
      rm-improved
    ];
  };

  programs = {
    bat.enable = true;
    bottom.enable = true;
    fd.enable = true;
    gpg.enable = true;
    ripgrep.enable = true;
    tealdeer.enable = true;
  };
}
