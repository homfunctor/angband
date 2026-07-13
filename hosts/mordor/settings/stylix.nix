{flake, ...}: {
  imports = with flake.modules.nixos; [
    stylix-cursor-nordzy
    stylix-fonts-iosevka
    stylix-icons-flatRemixBlackDark
    stylix-theme-warning
  ];

  nixos.opts.stylix.fontSizes.terminal = 14;
}
