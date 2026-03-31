# it's nice
{
  config,
  lib,
  pkgs,
  ...
}:
lib.mkIf config.nixos.opts.tier.niceTTY.enabled {
  environment.systemPackages = with pkgs.fishPlugins;
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
      // config.nixos.opts.shell.extraAliases;

    # starship and zoxide handled by home-manager
    interactiveShellInit = ''
      starship init fish | source
      zoxide init fish | source
    '';

    promptInit = "set fish_greeting";
  };
}
