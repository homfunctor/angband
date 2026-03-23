# default application settings
# designed for use with xdg mimeapps setup (set name, desktop),
# and general usage (args, exe, pkg)
# args: arguments commonly used with app
# desktop: desktop file name (without extension)
# exe: executable found at pkg path
# pkg: package path
# based on modules when possible
{
  config,
  lib,
  osConfig,
  pkgs,
  ...
}: let
  inherit (lib) getExe;
in {
  home.opts.apps = rec {
    archive = {
      desktop = "peazip";
      exe = getExe archive.pkg;
      pkg = pkgs.peazip;
    };

    audio = video;

    browser = {
      desktop = "firefox";
      exe = getExe browser.pkg;
      pkg = config.programs.firefox.package;
    };

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
      exe = getExe term-text.pkg;
      pkg = config.programs.nixvim.package;
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
