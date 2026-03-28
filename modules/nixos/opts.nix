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
      extMonitors = mkListOpt str null "names of external/extra monitors";
      mainMonitor = mkStrOpt null "main monitor";
      monitors = mkListOpt str null "names of monitors";
      numWSPerD = mkIntOpt 2 "number of workspaces per display";
      positions = mkListOpt (listOf int) null "positions of monitors";
      resolutions = mkListOpt (listOf int) null "resolutions of monitors";
    };

    # shell.nix
    shell.name = mkStrOpt "fish" "shell to use";

    # stylix.nix
    stylix = {
      enable = mkBoolOpt false "enable stylix";

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

    # wm.nix
    wm.niri = {
      appBinds.enable =
        mkBoolOpt false
        "additional niri binds for opening some applications";
      pkg = mkAttrOpt pkgs.niri "niri package to use";
    };
  };
}
