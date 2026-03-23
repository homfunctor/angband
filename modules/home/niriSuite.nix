{
  config,
  lib,
  osConfig,
  pkgs,
  ...
}: let
  niriBindsEnabled = osConfig.nixos.opts.wm.niri.appBinds.enable;
in
  lib.mkIf config.home.opts.tier.work.enabled {
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

    programs = {
      cava.enable = true;

      niri.settings = lib.mkIf niriBindsEnabled {
        binds = with config.lib.niri.actions; {
          "Mod+Ctrl+Shift+C".action.spawn = lib.getExe pkgs.gnome-calculator;
        };
      };

      eza.enable = true;

      # todo:  slightly broken rn
      yazi = {
        enable = true;
        settings.manager = {
          ratio = [1 2 4];
          show_hidden = true;
          show_symlink = true;
          sort_by = "alphabetical";
          sort_dir_first = true;
          sort_sensitive = false;
        };
      };

      zoxide.enable = true;
    };

    services = {
      network-manager-applet.enable = true;
      udiskie = {
        enable = true;

        automount = true;
        notify = true;
        tray = "always";
      };
    };
  }
