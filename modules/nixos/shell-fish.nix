# it's nice
{pkgs, ...}: {
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

    shellAliases = {
      # aliases
      # quick navigation to special directories
      hfhs = "z /etc/profiles/per-user";
      nfhs = "z /run/current-system";
      ns = "z /nix/store";

      # nix
      ninst = "nix-instantiate";
      nloc = "nix-locate --minimal";

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
      eza = "eza -G -x --color=always --icons=always";
      gita = "git add .";
      gitc = "git commit -m";
      gitlol = "gita && gitc \"ok\" && gitps";
      gitpl = "git pull";
      gitps = "git push";
      grep = "rg";
      ls = "eza -G -x --color=always --icons=always";
      n = "nvim";
      yz = "yazi .";
    };

    # starship and zoxide handled by home-manager
    interactiveShellInit = ''
      starship init fish | source
      zoxide init fish | source
    '';

    promptInit = "set fish_greeting";
  };
}
