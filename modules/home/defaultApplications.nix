# default application settings
# designed for use with xdg mimeapps setup (set name, desktop),
# and general usage (args, exe, pkg)
# args: arguments commonly used with app
# desktop: desktop file name (without extension)
# exe: executable found at pkg path
# pkg: package path
# which: when the wrapped version is
# based on modules when possible
{
  config,
  lib,
  osConfig,
  pkgs,
  ...
}: let
  inherit (config.home.opts) quirk tier;
  inherit (lib) getExe mkIf mkMerge;
in
  mkIf tier.work.enabled {
    home.opts.apps = rec {
      archive = {
        desktop = "peazip";
        exe = getExe archive.pkg;
        pkg = pkgs.peazip;
      };

      audio = mkMerge [
        (mkIf (!quirk.strawberry.enable) {
          inherit (video) desktop exe pkg;
        })

        (mkIf quirk.strawberry.enable rec {
          desktop = "strawberry";
          exe = getExe pkg;
          pkg = pkgs.strawberry;
        })
      ];

      browser = mkMerge [
        (mkIf (!quirk.vivaldi.enable) rec {
          desktop = "firefox";
          exe = getExe pkg;
          pkg = config.programs.firefox.package;
        })

        (mkIf quirk.vivaldi.enable rec {
          desktop = "vivaldi-stable";
          exe = getExe pkg;
          pkg = pkgs.vivaldi;
        })
      ];

      directory = {
        args = "";
        desktop = "nemo";
        exe = getExe directory.pkg;
        pkg = pkgs.nemo-with-extensions;
      };

      image = {
        desktop = "org.gnome.eog";
        exe = getExe image.pkg;
        pkg = pkgs.eog;
      };

      officeCalc = {
        desktop = "calc";
        exe = "${officeCalc.pkg}/bin/scalc";
        pkg = pkgs.libreoffice-fresh;
      };

      officeImpress = {
        inherit (officeCalc) pkg;
        desktop = "impress";
        exe = "${officeImpress.pkg}/bin/simpress";
      };

      officeWriter = {
        inherit (officeCalc) pkg;
        desktop = "writer";
        exe = "${officeCalc.pkg}/bin/swriter";
      };

      pdf = {
        desktop = "sioyek";
        exe = getExe pdf.pkg;
        pkg = config.programs.sioyek.package;
      };

      shell = let
        shellName = osConfig.nixos.opts.shell.name;
      in {
        exe = getExe shell.pkg;
        pkg = config.programs."${shellName}".package;
      };

      terminal = {
        desktop = "kitty";
        exe = getExe terminal.pkg;
        pkg = config.programs.kitty.package;
      };

      term-text = {
        desktop = "nvim";
        exe = getExe term-text.pkg;
        pkg = config.programs.nixvim.package;
        which = "nvim";
      };

      text = {
        desktop = "neovide";
        exe = getExe text.pkg;
        pkg = config.programs.neovide.package;
      };

      video = {
        desktop = "vlc";
        exe = getExe video.pkg;
        pkg = pkgs.vlc;
      };
    };
  }
