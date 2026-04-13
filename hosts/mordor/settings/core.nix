{
  flake,
  pkgs,
  ...
}: {
  imports = with flake.modules.nixos; [
    tier-personal

    lanzaboote
    lixFresh
    notNix
    rustOverlay
    scx
    shell-fish
    sops-nix
    wm-niri
    vm
  ];

  nixos.opts = rec {
    adminUser = "gorthaur";
    userNames = [
      adminUser
      "mairon"
    ];

    shell.extraAliases = {
      # sometimes needed when using xwayland(-satellite)
      "m1" = "xrandr --output DP-1 --primary";
      "m2" = "xrandr --output HDMI-A-1 --primary";
      # for language rendering issues
      chwine = "LANG=zh_CN.UTF-8 wine";
      jpwine = "LANG=ja_JP.utf8 wine";
      # useful when making civ5 mods
      modsums = "hashdeep -l -r -c md5 */ | awk -F, 'NR>4 {print $2 \"  \" $3}'";
    };

    lanzaboote.enable = true;

    sops = {
      syncthing.enable = true;
      users.enable = true;
    };

    wm.niri = {
      enable = true;
      appBinds.enable = true;
      pkg = pkgs.niri-unstable;
    };
  };
}
