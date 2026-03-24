{
  flake,
  inputs,
  osConfig,
  ...
}: {
  imports = with flake.modules.home; [
    purpose-minTTY

    LaTeX
    defaultApplications
    gui-noctalia
    shell-fish-integration
    vivaldi
    wm-niri
    wm-niri-workLaptop
    workStuff
  ];
  home.opts = {
    userName = builtins.elemAt osConfig.nixos.opts.userNames 0;

    display.backgrounds = ["${inputs.utumno}/assets/eregion.png"];

    shellInt = {
      eza.enable = true;
      kitty.enable = true;
      nix-index.enable = true;
      starship.enable = true;
      yazi.enable = true;
      zoxide.enable = true;
    };

    quirk.vivaldi.enable = true;

    wm.niri.screencast.enable = true;
  };
}
