{
  flake,
  pkgs,
  ...
}: {
  imports = with flake.modules.nixos; [
    tier-work

    lanzaboote
    lix-stable
    scx
    sops-nix
    stylix
    unfree
    vm
    wm-niri
  ];

  nixos.opts = rec {
    adminUser = "annatar";
    userNames = [adminUser];

    sops = {
      syncthing.enable = true;
      users.enable = true;
    };

    wm.niri = {
      appBinds.enable = true;
      pkg = pkgs.niri-stable;
    };
  };
}
