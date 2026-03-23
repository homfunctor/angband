{
  config,
  pkgs,
  ...
}: let
  inherit (config.home.opts) userName;
in {
  services.syncthing = {
    enable = true;
    package = pkgs.syncthing;

    # todo: get syncthingtray working properly
    tray = {
      enable = false;
      command = "{lib.getExe pkgs.syncthingtray} --wait --config-dir-path /home/${userName}/.local/state/syncthing";
      package = pkgs.syncthingtray;
    };
  };
}
