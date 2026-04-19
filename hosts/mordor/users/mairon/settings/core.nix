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
    gui-noctalia
    neovim
    neovim-standardEnv
    nix-index
    nixTools
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
      "${inputs.utumno}/assets/winter1.png"
      "${inputs.utumno}/assets/winter4.png"
      "${inputs.utumno}/assets/winter5.png"
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
