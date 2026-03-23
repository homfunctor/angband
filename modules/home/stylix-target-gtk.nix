{
  config,
  lib,
  osConfig,
  ...
}: let
  cfg = osConfig.nixos.opts.stylix;
in {
  gtk = lib.mkIf cfg.enable {
    inherit (cfg) iconTheme;

    gtk4.theme = config.gtk.theme;

    gtk3.extraConfig = {
      gtk-application-prefer-dark-theme = true;
      gtk-recent-files-enabled = false;
    };

    gtk4.extraConfig = {
      gtk-application-prefer-dark-theme = true;
      gtk-recent-files-enabled = false;
    };
  };

  stylix.targets.gtk = {
    enable = true;
    # disable rounded corners where possible
    extraCss = ''
      * { border-radius: 0; }
    '';
  };
}
