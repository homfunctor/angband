{
  flake,
  lib,
  ...
}: let
  inherit
    (flake.lib)
    mkAttrOpt
    mkBoolOpt
    mkListOpt
    mkStrOpt
    nameListFromDir
    ;
  inherit (lib) genAttrs;
in {
  options.home.opts = {
    # core.nix
    userName = mkStrOpt null "current user's name";

    apps = mkAttrOpt {} "monolithic default application settings";
    customUserDirs = mkAttrOpt {} "custom settings for user directories (XDG)";

    purpose = let
      tiers = [
        "minTTY"
        "niceTTY"
        "work"
        "personal"
      ];
    in
      genAttrs tiers (name: {
        enabled = mkBoolOpt false "tier ${name} is enabled";
      });

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

    # gui.nix
    display = {
      backgrounds =
        mkListOpt lib.types.str null
        "file paths for backgrounds, one for each monitor";
    };

    # neovim.nix
    nvim = {
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

    # syncthing.nix
    syncthing = {
      enable = mkBoolOpt false "enable syncthing";

      versioning = mkAttrOpt {
        params = {
          cleanoutDays = "0";
          keep = "10";
        };
        type = "simple";
      } "default versioning settings";

      folder =
        genAttrs (
          nameListFromDir ./syncthing/folders
        ) (name: {
          enable = mkBoolOpt false "sync ${name}";
        });
    };

    # wm.nix
    wm.niri.screencast.enable = mkBoolOpt false "enable screencasting keybind";
  };
}
