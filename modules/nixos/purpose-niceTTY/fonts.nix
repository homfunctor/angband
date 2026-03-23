{
  config,
  pkgs,
  ...
}: {
  console = {
    font = "ter-124b";
    keyMap = "us";
    packages = [pkgs.terminus_font];
  };

  environment.variables.LOG_ICONS = "true";

  fonts = {
    fontDir.enable = true;

    fontconfig = {
      enable = true;

      # todo: double check
      antialias = true;
      cache32Bit = true;
      hinting.enable = true;
      subpixel.rgba = "rgb";
      useEmbeddedBitmaps = true;

      defaultFonts = with config.stylix.fonts; {
        monospace = [monospace.name "Noto Color Emoji"];
        sansSerif = [sansSerif.name "Noto Color Emoji"];
        serif = [serif.name "Noto Color Emoji"];
      };
    };

    packages = with pkgs; [
      freefont_ttf
      gyre-fonts
      nerd-font-patcher
      nerd-fonts.iosevka
      nerd-fonts.tinos
      noto-fonts
      noto-fonts-cjk-sans
      noto-fonts-cjk-serif
      noto-fonts-color-emoji
      unifont
    ];
  };
}
