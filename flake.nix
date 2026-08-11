{
  description = "Angband NixOS Flake";

  outputs = inputs:
    inputs.blueprint {
      inherit inputs;
      systems = ["x86_64-linux"];
    };

  inputs = {
    # core
    blueprint = {
      inputs.nixpkgs.follows = "nixpkgs";
      url = "github:numtide/blueprint";
    };

    home-manager = {
      inputs.nixpkgs.follows = "nixpkgs";
      url = "github:nix-community/home-manager";
    };

    # nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nixpkgs.url = "github:nixos/nixpkgs?ref=c9df19510ada23dcdf2cf715caa1ea4509deb125";

    # niri
    niri-flake = {
      inputs.nixpkgs.follows = "nixpkgs";
      url = "github:sodiboo/niri-flake";
    };

    noctalia = {
      inputs.nixpkgs.follows = "nixpkgs";
      url = "github:noctalia-dev/noctalia/legacy-v4";
    };

    # nix things
    disko = {
      inputs.nixpkgs.follows = "nixpkgs";
      url = "github:nix-community/disko";
    };

    lanzaboote = {
      inputs = {
        nixpkgs.follows = "nixpkgs";
        rust-overlay.follows = "rust-overlay";
      };
      url = "github:nix-community/lanzaboote";
    };

    lix = {
      flake = false;
      url = "https://git.lix.systems/lix-project/lix/archive/main.tar.gz";
    };

    lix-module = {
      inputs = {
        lix.follows = "lix";
        nixpkgs.follows = "nixpkgs";
      };
      url = "https://git.lix.systems/lix-project/nixos-module/archive/main.tar.gz";
    };

    nix-gaming = {
      inputs.nixpkgs.follows = "nixpkgs";
      url = "github:fufexan/nix-gaming";
    };

    nix-index-database = {
      inputs.nixpkgs.follows = "nixpkgs";
      url = "github:mic92/nix-index-database";
    };

    nixcord = {
      inputs.nixpkgs.follows = "nixpkgs";
      url = "github:kaylorben/nixcord";
    };

    nixvim.url = "github:nix-community/nixvim";

    rust-overlay = {
      inputs.nixpkgs.follows = "nixpkgs";
      url = "github:oxalica/rust-overlay";
    };

    sops-nix = {
      inputs.nixpkgs.follows = "nixpkgs";
      url = "github:mic92/sops-nix";
    };

    stylix = {
      inputs.nixpkgs.follows = "nixpkgs";
      url = "github:nix-community/stylix?ref=14814ef555d8148ab82eba5054e654cd9eae3a1f";
      # url = "github:nix-community/stylix";
    };

    treefmt-nix = {
      inputs.nixpkgs.follows = "nixpkgs";
      url = "github:numtide/treefmt-nix";
    };

    # secrets and privacy for the 21st century schizoid
    utumno = {
      inputs = {
        blueprint.follows = "blueprint";
        nixpkgs.follows = "nixpkgs";
        sops-nix.follows = "sops-nix";
        treefmt-nix.follows = "treefmt-nix";
      };
      url = "git+ssh://git@github.com/homfunctor/utumno?shallow=1?ref=main";
    };

    # retained only for laptop
    nixos-hardware.url = "github:nixos/nixos-hardware";
  };
}
