{
  flake,
  inputs,
  ...
}: {
  imports = with flake.modules.nixos; [
    inputs.stylix.nixosModules.stylix

    stylix
    stylix-cursor-nordzy
    stylix-fonts-iosevka
    stylix-icons-flatRemixBlackDark
    stylix-theme-sdg
  ];

  nixos.opts.stylix = {
    enable = true;

    fontSizes = {
      applications = 16;
      desktop = 16;
      popups = 16;
      terminal = 16;
    };

    opacity.popups = 1.0;
  };
}
