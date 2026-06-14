{
  flake,
  inputs,
  osConfig,
  ...
}: {
  imports = with flake.modules.home; [
    tier-work

    LaTeX
    chromium
    defaultApplications
    # gui-noctalia
    neovim
    neovim-mordor
    nix-index
    nixTools
    shell-fish
    shell-integration
    starship
    wm-niri
    wm-niri-workAtHome
    workStuff
    zoxide
  ];
  home.opts = {
    userName = builtins.elemAt osConfig.nixos.opts.userNames 1;

    display.backgrounds = [
      "${inputs.utumno}/assets/valinor.png"
      "${inputs.utumno}/assets/rivendell.png"
      "${inputs.utumno}/assets/numenor.png"
    ];

    shellInt = {
      eza.enable = true;
      kitty.enable = true;
      nix-index.enable = true;
      starship.enable = true;
      yazi.enable = true;
      zoxide.enable = true;
    };

    syncthing.deviceName = "numenor";
  };
}
