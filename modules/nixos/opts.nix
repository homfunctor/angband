# always imported in hosts/<host>/configuration.nix
{
  flake,
  lib,
  pkgs,
  ...
}: let
  inherit
    (flake.lib)
    mkAttrOpt
    mkBoolOpt
    mkFloatOpt
    mkIntOpt
    mkListOpt
    mkStrOpt
    ;

  inherit (lib) genAttrs types;
in {
  options.nixos.opts = with types; {
    # core.nix
    adminUser = mkStrOpt null "main user";
    userNames = mkListOpt str null "all usernames";

    shell = {
      extraAliases = mkAttrOpt {} "extra shell aliases";
      name = mkStrOpt "fish" "shell to use";
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

    sops = {
      syncthing.enable = mkBoolOpt false "allow sops-nix to manage syncthing";
      users.enable = mkBoolOpt false "allow sops-nix to manage users";
    };

    wm.niri = {
      enabled = mkBoolOpt false "niri is enabled";
      appBinds.enable =
        mkBoolOpt false
        "additional niri binds for opening some applications";
      pkg = mkAttrOpt pkgs.niri "niri package to use";
    };

    # gui.nix
    gui.noct = {
      bar.widgets = mkAttrOpt null "widgets for noctalia-shell";
      controlCenter =
        mkAttrOpt null
        "noctalia-shell control center cards and shortcuts";
      misc =
        mkAttrOpt null
        "misc settings adjoined to noctalia-shell.settings";
      pkg =
        mkAttrOpt
        pkgs.noctalia-shell "noctalia-shell package";
    };

    # hardware.nix
    display = {
      extMonitors = mkListOpt str [] "names of external/extra monitors";
      mainMonitor = mkStrOpt null "main monitor";
      monitors = mkListOpt str [] "names of monitors";
      numWSPerD = mkIntOpt 2 "number of workspaces per display";
      positions = mkListOpt (listOf int) [] "positions of monitors";
      resolutions = mkListOpt (listOf int) [] "resolutions of monitors";
    };

    # stylix.nix
    stylix = {
      enabled = mkBoolOpt false "stylix is enabled";

      fontSizes = {
        applications = mkIntOpt 12 "size of application fonts";
        desktop = mkIntOpt 12 "size of application fonts";
        popups = mkIntOpt 12 "size of application fonts";
        terminal = mkIntOpt 12 "size of application fonts";
      };

      iconTheme = {
        name = mkStrOpt null "icon theme name";
        package = mkAttrOpt null "icon theme package";
      };

      opacity = {
        desktop = mkFloatOpt 1.0 "desktop opacity";
        popups = mkFloatOpt 0.95 "popups opacity";
        terminal = mkFloatOpt 0.80 "terminal opacity";
      };
    };
  };
}
