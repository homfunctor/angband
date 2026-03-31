{
  flake,
  pkgs,
  ...
}: {
  imports = with flake.modules.nixos; [
    purpose-minTTY

    lanzaboote
    lixStable
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

    fish.extraAliases = {
      # sometimes needed when using xwayland(-satellite)
      "m1" = "xrandr --output DP-1 --primary";
      "m2" = "xrandr --output HDMI-A-1 --primary";
      chwine = "LANG=zh_CN.UTF-8 wine";
      jpwine = "LANG=ja_JP.utf8 wine";
      # useful when making mods
      modsums = "hashdeep -l -r -c md5 */ | awk -F, 'NR>4 {print $2 \"  \" $3}'";
    };

    lanzaboote.enable = false;

    sops = {
      syncthing.enable = false;
      users.enable = false;
    };

    wm.niri = {
      appBinds.enable = false;
      pkg = pkgs.niri-unstable;
    };
  };
}
