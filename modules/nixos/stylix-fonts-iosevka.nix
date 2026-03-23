{
  config,
  lib,
  pkgs,
  ...
}: let
  cfg = config.nixos.opts.stylix;
in
  lib.mkIf cfg.enable {
    stylix.fonts = {
      monospace = {
        name = "Iosevka Nerd Font Mono";
        package = pkgs.nerd-fonts.iosevka;
      };

      sansSerif = {
        name = "Iosevka Nerd Font";
        package = pkgs.nerd-fonts.iosevka;
      };

      serif = {
        name = "Iosevka Nerd Font";
        package = pkgs.nerd-fonts.iosevka;
      };
    };
  }
