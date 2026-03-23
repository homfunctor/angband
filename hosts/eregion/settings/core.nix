{flake, ...}: {
  imports = with flake.modules.nixos; [
    opts

    purpose-work

    lanzaboote
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
  };
}
