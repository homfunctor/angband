{
  config,
  lib,
  osConfig,
  pkgs,
  ...
}: let
  enabled =
    config.home.opts.tier.work.enabled
    && osConfig.nixos.opts.wm.niri.enable;
in
  lib.mkIf enabled {
    xdg.portal = {
      enable = true;
      xdgOpenUsePortal = true;

      config = {
        common = {
          default = ["gtk" "gnome"];
          "org.freedesktop.impl.portal.RemoteDesktop" = "gnome";
          "org.freedesktop.impl.portal.ScreenCast" = "gnome";
          "org.freedesktop.impl.portal.Screenshot" = "gnome";
          "org.freedesktop.impl.portal.Secret" = ["gnome-keyring"];
        };
      };

      extraPortals = with pkgs; [
        xdg-desktop-portal-gnome
        xdg-desktop-portal-gtk
      ];
    };

    services.polkit-gnome.enable = true;
  }
