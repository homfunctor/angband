# imported by hosts/<host>/users/<user>/home-configuration.nix
{
  flake,
  lib,
  osConfig,
  ...
}: let
  inherit
    (flake.lib)
    mkAttrOpt
    mkBoolOpt
    mkListOpt
    mkPathOpt
    mkPkgOpt
    mkStrOpt
    nameListFromDir
    ;
  inherit (lib) genAttrs types;
in {
  options.home.opts = {
    # core.nix
    userName = mkStrOpt null "current user's name";

    # monolithic default application settings
    apps = let
      appType = [
        "archive"
        "audio"
        "browser"
        "directory"
        "image"
        "officeCalc"
        "officeImpress"
        "officeWriter"
        "pdf"
        "shell"
        "terminal"
        "term-text"
        "text"
        "video"
      ];
    in
      genAttrs appType (_: {
        args = mkStrOpt null "arguments usually used with application";
        desktop = mkStrOpt null "name of .desktop file";
        exe = mkPathOpt ./. "actual location of executable in store";
        pkg = mkPkgOpt null "package used";
        which = mkStrOpt null "directly references output of 'which applicationName' ";
      });

    customUserDirs = mkAttrOpt {} "custom settings for user directories (XDG)";

    display = {
      backgrounds =
        mkListOpt types.str null
        "file paths for backgrounds, one for each monitor";
    };

    nvim = {
      enable = mkBoolOpt false "";

      # base16? no, base20
      extraColors = mkAttrOpt {
        Boolean.fg = "#5A6B9C";
        Comment = {
          fg = "#8B7AA3";
          italic = true;
        };
        Keyword.fg = "#7ABF9E";
        Number.fg = "#4A6B8A";
      } "";

      # automatically prepare options for all neovim plugin modules
      plugins = let
        pluginNames = nameListFromDir ./neovim/plugins;
      in
        genAttrs pluginNames (name: {
          enable = mkBoolOpt false "enable ${name}";
        });
    };

    # weird things i insist upon
    quirk = {
      strawberry.enable = mkBoolOpt false "make strawberry the default audio application";

      vivaldi.enable = mkBoolOpt false "make vivaldi the default browser";
    };

    shellInt = let
      apps = [
        "eza"
        "kitty"
        "nix-index"
        "starship"
        "yazi"
        "zoxide"
      ];
    in
      genAttrs apps (name: {
        enable = mkBoolOpt false "enable ${name} shell integration";
      });

    syncthing = {
      enable = mkBoolOpt false "enable syncthing";

      deviceName =
        mkStrOpt osConfig.networking.hostName
        "name of syncthing device";

      versioning = mkAttrOpt {
        params = {
          cleanoutDays = "0";
          keep = "10";
        };
        type = "simple";
      } "default versioning settings";

      folders = let
        dirNames = nameListFromDir ./syncthing/folders;
      in
        genAttrs dirNames (name: {
          devices = mkListOpt types.str [] "devices which want ${name}";
        });
    };

    # over-complicated system to make things depend on specific tiers
    tier = let
      tiers = [
        "niceTTY"
        "work"
        "personal"
      ];
    in
      genAttrs tiers (name: {
        enabled = mkBoolOpt false "tier ${name} is enabled";
      });

    wm.niri = {
      screencast.enable = mkBoolOpt false "enable screencasting keybind";
      # there isn't an official niri module in stylix
      # this is if i want to disable my stylix settings
      # for niri
      stylix.enable = mkBoolOpt true "";
    };

    # stylix.nix
    # to bypass imports nonsense
    # stylix.enable is on nixos level
    stylix.targets = {
      gtk = {
        enable = mkBoolOpt false "";
        extraCss = mkStrOpt null "";
      };

      nixvim = {
        enable = mkBoolOpt false "";
        plugin = mkStrOpt "mini.base16" "";
        transparentBackground = {
          main = mkBoolOpt false "";
          signColumn = mkBoolOpt false "";
        };
      };

      # stays false to override stylix's own
      # noctalia-shell settings
      noctalia-shell.enable = mkBoolOpt false "";

      qt.enable = mkBoolOpt false "";
    };
  };
}
