{
  flake,
  inputs,
  osConfig,
  ...
}: {
  imports = with flake.modules.home; [
    purpose-work

    LaTeX
    defaultApplications
    gui-noctalia
    neovim-standardEnv
    nix-index
    nixTools
    shell-fish-integration
    wm-niri
    wm-niri-workAtHome
    workStuff
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

    syncthing = {
      enable = true;
      deviceName = "numenor";
    };
  };
}
