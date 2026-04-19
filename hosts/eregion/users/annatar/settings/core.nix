{
  flake,
  inputs,
  osConfig,
  ...
}: {
  imports = with flake.modules.home; [
    tier-work

    LaTeX
    defaultApplications
    gui-noctalia
    neovim-standardEnv
    nix-index
    nixTools
    shell-integration
    vivaldi
    wm-niri
    wm-niri-workLaptop
    workStuff
  ];
  home.opts = {
    userName = builtins.elemAt osConfig.nixos.opts.userNames 0;

    display.backgrounds = ["${inputs.utumno}/assets/eregion.png"];

    quirk.vivaldi.enable = true;

    shellInt = {
      eza.enable = true;
      kitty.enable = true;
      nix-index.enable = true;
      starship.enable = true;
      yazi.enable = true;
      zoxide.enable = true;
    };

    wm.niri.screencast.enable = true;
  };
}
