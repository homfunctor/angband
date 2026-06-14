{
  flake,
  pkgs,
  ...
}: {
  imports = with flake.modules.nixos; [
    tier-personal

    lanzaboote
    lix-latest
    nix-ld
    scx
    sops-nix
    stylix
    vm
    wm-niri
  ];

  nixos.opts = rec {
    adminUser = "gorthaur";
    userNames = [
      adminUser
      "mairon"
    ];

    sops = {
      syncthing.enable = true;
      users.enable = true;
    };

    wm.niri = {
      appBinds.enable = true;
      pkg = pkgs.niri-unstable;
    };
  };
}
