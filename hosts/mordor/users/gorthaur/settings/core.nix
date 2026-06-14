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
    # gui-noctalia
    neovim
    neovim-mordor
    nix-index
    nixTools
    shell-fish
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

    shellAliases = {
      # sometimes needed when using xwayland(-satellite)
      "m1" = "xrandr --output DP-1 --primary";
      "m2" = "xrandr --output HDMI-A-1 --primary";
      # for language rendering issues
      chwine = "LANG=zh_CN.UTF-8 wine";
      jpwine = "LANG=ja_JP.utf8 wine";
      # useful when making civ5 mods
      modsums = "hashdeep -l -r -c md5 */ | awk -F, 'NR>4 {print $2 \"  \" $3}'";
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
