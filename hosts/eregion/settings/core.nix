{
  flake,
  inputs,
  pkgs,
  ...
}: {
  imports = with flake.modules.nixos;
    [
      purpose-work

      lanzaboote
      lixStable
      scx
      shell-fish
      sops-nix
    ]
    ++ (with inputs; [
      stylix.nixosModules.stylix
    ]);

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
