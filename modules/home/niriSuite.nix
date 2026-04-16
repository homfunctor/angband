# imported by wm-niri
{
  config,
  flake,
  lib,
  osConfig,
  pkgs,
  ...
}: let
  enabled =
    config.home.opts.tier.work.enabled
    && osConfig.nixos.opts.wm.niri.enable;

  niriBindsEnabled = osConfig.nixos.opts.wm.niri.appBinds.enable;
in
  lib.mkIf enabled {
    home.packages = with pkgs; [
      eog
      gnome-calculator
      gnome-calendar
      gnome-disk-utility
      libwebp
      mission-center
      nemo-with-extensions # just feels so good
      networkmanagerapplet
      peazip
      poppler-utils
      pwvucontrol
      systemctl-tui
      vlc # good stuff, nostalgic
      wayland-utils
      wl-clipboard-rs
      xwayland-satellite
    ];

    programs.niri.settings = lib.mkIf niriBindsEnabled {
      binds = with config.lib.niri.actions; {
        "Mod+Ctrl+Shift+C".action.spawn = lib.getExe pkgs.gnome-calculator;
      };
    };

    services = {
      network-manager-applet.enable = true;
      udiskie = {
        enable = true;

        automount = false;
        notify = false;
        tray = "always";
      };
    };
  }
