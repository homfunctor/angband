{
  flake,
  inputs,
  osConfig,
  ...
}: {
  imports = with flake.modules.home; [
    tier-personal

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
    vivaldi
    wm-niri
    wm-niri-personal
    zoxide
  ];
  home.opts = {
    userName = builtins.elemAt osConfig.nixos.opts.userNames 0;

    customUserDirs = {
      music = "/vault/Music";
      pictures = "/vault/Pictures";
      videos = "/vault/Videos";
    };

    display.backgrounds = [
      "${inputs.utumno}/assets/minas-morgul.png"
      "${inputs.utumno}/assets/barad-dur.png"
      "${inputs.utumno}/assets/orodruin.png"
    ];

    quirk = {
      strawberry.enable = true;
      vivaldi.enable = true;
    };

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
