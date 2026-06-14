# imported by hosts/<host>/users/<user>/settings/core.nix
# it's nice
{
  config,
  flake,
  lib,
  pkgs,
  ...
}: let
  inherit (config.home) opts;
in
  flake.lib.reqHTier config "work" {
    home.packages = with pkgs.fishPlugins;
      [
        colored-man-pages
        fzf
        grc
      ]
      ++ (with pkgs; [
        fzf
        grc
      ]);

    programs.fish = {
      enable = true;
      shellAliases =
        {
          # quick navigation to special directories
          hfhs = "z /etc/profiles/per-user";
          nfhs = "z /run/current-system";
          ns = "z /nix/store";

          # nix
          ninst = "nix-instantiate";
          nloc = "nix-locate --minimal";
          nsp = "nix-shell -p ";

          # ...
          ".." = "z ../";
          "..." = "z ../../";
          "...." = " z ../../../";
          "....." = "z ../../../../";
          "......" = "z ../../../../..";

          # nice stuff
          cat = "bat";
          cd = "z";
          erd = "erd -I --suppress-size";
          gita = "git add .";
          gitc = "git commit -m";
          gitlol = "gita && gitc \"ok\" && gitps";
          gitpl = "git pull";
          gitps = "git push";
          grep = "rg";
          ls = "eza";
          n = "nvim";
          yz = "EDITOR='nvim' yazi";
        }
        // opts.shellAliases;

      interactiveShellInit = "set fish_greeting";

      shellInit =
        (lib.optionalString opts.shellInt.starship.enable
          "starship init fish | source\n")
        + (lib.optionalString opts.shellInt.zoxide.enable
          "zoxide init fish | source\n");
    };
  }
