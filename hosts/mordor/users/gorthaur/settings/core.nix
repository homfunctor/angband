{
  flake,
  inputs,
  osConfig,
  ...
}: {
  imports = with flake.modules.home; [
    purpose-minTTY

    LaTeX
    apotheosis
    civ5-map-image
    defaultApplications
    gui-noctalia
    ironyModManager
    neovim-standardEnv
    nix-index
    nixTools
    shell-fish-integration
    vivaldi
    wm-niri
    wm-niri-personal
    workStuff
  ];
  home.opts = {
    userName = builtins.elemAt osConfig.nixos.opts.userNames 0;

    customUserDirs = {
      music = "/vault/Music";
      pictures = "/vault/Pictures";
      videos = "/vault/Videos";
    };

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

    quirk = {
      strawberry.enable = true;
      vivaldi.enable = true;
    };
  };
}
