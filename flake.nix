{
  outputs = inputs:
    inputs.blueprint {
      inherit inputs;
      systems = ["x86_64-linux"];
    };

  description = "Angband NixOS Flake";

  inputs = {
    # core
    blueprint = {
      inputs.nixpkgs.follows = "nixpkgs";
      url = "github:numtide/blueprint";
    };

    disko = {
      inputs.nixpkgs.follows = "nixpkgs";
      url = "github:nix-community/disko";
    };

    home-manager = {
      inputs.nixpkgs.follows = "nixpkgs";
      url = "github:nix-community/home-manager";
    };

    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    sops-nix = {
      inputs.nixpkgs.follows = "nixpkgs";
      url = "github:mic92/sops-nix";
    };

    stylix = {
      inputs.nixpkgs.follows = "nixpkgs";
      url = "github:danth/stylix";
    };

    treefmt-nix = {
      inputs.nixpkgs.follows = "nixpkgs";
      url = "github:numtide/treefmt-nix";
    };

    # niri
    niri-flake = {
      inputs.nixpkgs.follows = "nixpkgs";
      url = "github:sodiboo/niri-flake";
    };

    noctalia = {
      inputs.nixpkgs.follows = "nixpkgs";
      url = "github:noctalia-dev/noctalia-shell";
    };

    # nix things
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

    nix-search = {
      inputs.nixpkgs.follows = "nixpkgs";
      url = "github:diamondburned/nix-search";
    };

    nixcord = {
      inputs.nixpkgs.follows = "nixpkgs";
      url = "github:kaylorben/nixcord";
    };

    nixvim = {
      inputs.nixpkgs.follows = "nixpkgs";
      url = "github:nix-community/nixvim";
    };

    rust-overlay = {
      inputs.nixpkgs.follows = "nixpkgs";
      url = "github:oxalica/rust-overlay";
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
