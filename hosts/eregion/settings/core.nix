{
  flake,
  pkgs,
  ...
}: {
  imports = with flake.modules.nixos; [
    purpose-work

    lanzaboote
    lixStable
    scx
    shell-fish
    sops-nix
    wm-niri
  ];

  nixos.opts = rec {
    adminUser = "annatar";
    userNames = [adminUser];

    lanzaboote.enable = true;

    sops = {
      syncthing.enable = true;
      users.enable = true;
    };

    wm.niri = {
      enable = true;
      appBinds.enable = true;
      pkg = pkgs.niri-stable;
    };
  };
}
