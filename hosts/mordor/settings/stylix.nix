{flake, ...}: {
  imports = with flake.modules.nixos; [
    stylix
    stylix-cursor-nordzy
    stylix-fonts-iosevka
    stylix-icons-flatRemixBlackDark
    stylix-theme-sdg
  ];

  nixos.opts.stylix = {
    enable = true;
    fontSizes.terminal = 14;
  };
}
