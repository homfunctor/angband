{inputs, ...}: {
  # required for using home-manager user packages within nixos
  environment.pathsToLink = [
    "/share/applications"
    "/share/xdg-desktop-portal"
  ];

  home-manager = {
    backupFileExtension = "hm.old";
    # 3 very important, load-bearing lines
    extraSpecialArgs = {inherit inputs;};
    useGlobalPkgs = true;
    useUserPackages = true;
  };
}
