{
  flake,
  pkgs,
  ...
}: {
  imports = with flake.modules.nixos; [
    purpose-minTTY

    lanzaboote
    lixStable
    scx
    shell-fish
    sops-nix
  ];

  nixos.opts = rec {
    adminUser = "annatar";
    userNames = [adminUser];

    hostName = "eregion";

    sops = {
      syncthing.enable = false;
      users.enable = true;
    };

    wm.niri = {
      appBinds.enable = true;
      pkg = pkgs.niri-stable;
    };
  };
}
