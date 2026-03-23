{
  config,
  lib,
  osConfig,
  ...
}: let
  cfg =
    osConfig.nixos.opts.stylix.enable
    && config.home.opts.tier.work.enabled;
in
  lib.mkIf cfg {
    gtk = {
      inherit (osConfig.nixos.opts.stylix) iconTheme;

      # 26.5 compatibility
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
