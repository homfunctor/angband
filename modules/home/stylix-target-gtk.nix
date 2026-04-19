# imported by hosts/<host>/users/<user>/settings/stylix.nix
{
  config,
  lib,
  osConfig,
  ...
}: let
  enabled =
    config.home.opts.tier.work.enabled
    && osConfig.nixos.opts.stylix.enabled;
in
  lib.mkIf enabled {
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

    home.opts.stylix.targets.gtk = {
      enable = true;
      # disable rounded corners where possible
      extraCss = ''
        * { border-radius: 0; }
      '';
    };
  }
