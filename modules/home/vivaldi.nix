{
  lib,
  pkgs,
  ...
}: {
  home = {
    packages = [pkgs.vivaldi];

    opts.apps.browser = lib.mkForce rec {
      desktop = "vivaldi-stable";
      exe = lib.getExe pkg;
      pkg = pkgs.vivaldi;
    };
  };
}
