# imported by hosts/<host>/settings/core.nix
{
  config,
  inputs,
  lib,
  ...
}: let
  flakeInputs = lib.filterAttrs (_: v:
    lib.isType "flake" v)
  inputs;
in {
  hardware.enableRedistributableFirmware = true;

  nix = {
    # still need to run 'just purgech' once
    channel.enable = false;

    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 7d";
      persistent = true;
    };

    optimise.automatic = true;

    # all the cool kids do it
    nixPath = lib.mapAttrsToList (n: _: "${n}=flake:${n}") flakeInputs;
    registry = lib.mapAttrs (_: flake: {inherit flake;}) flakeInputs;

    settings = {
      allowed-users = ["@wheel"];
      auto-optimise-store = true;
      builders-use-substitutes = true;
      experimental-features = [
        "flakes"
        "nix-command"
      ];
      flake-registry = "";
      http-connections = 50;
      keep-derivations = true;
      keep-going = true;
      keep-outputs = true;
      log-lines = 50;
      sandbox = true;
      trusted-users = ["root" config.nixos.opts.adminUser];
      warn-dirty = false;

      substituters = [
        "https://cache.nixos.org?priority=10"
        "https://niri.cachix.org"
        "https://nix-community.cachix.org"
        "https://nix-gaming.cachix.org"
        "https://numtide.cachix.org"
      ];

      trusted-public-keys = [
        "cache.nixos.org-1:6NCHdD59X431o0gWypbMrAURkbJ16ZPMQFGspcDShjY="
        "niri.cachix.org-1:Wv0OmO7PsuocRKzfDoJ3mulSl7Z6oezYhGhR+3W2964="
        "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
        "nix-gaming.cachix.org-1:nbjlureqMbRAxR1gJ/f3hxemL9svXaZF/Ees8vCUUs4="
        "numtide.cachix.org-1:2ps1kLBUWjxIneOy1Ik6cQjb41X0iXVXeHigGmycPPE"
      ];

      use-xdg-base-directories = true;
    };
  };

  nixpkgs = {
    # declared in flake.nix so that it gets passed to
    #   nix-shell -p
    # config.allowUnfree = true;
    hostPlatform = lib.mkDefault "x86_64-linux";
  };

  services.xserver.xkb = {
    layout = lib.mkDefault "us";
    variant = lib.mkDefault "";
  };

  system.stateVersion = "25.11";
}
