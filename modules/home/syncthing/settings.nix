{
  config,
  lib,
  ...
}: let
  inherit (config.home) homeDirectory opts;

  enabled = opts.syncthing.enable && opts.tier.work.enabled;
in
  lib.mkIf enabled {
    services.syncthing.settings = {
      extraOptions = [
        "--data=${homeDirectory}"
        "--config=${homeDirectory}/.local/state/syncthing"
        "--no-default-folder"
      ];

      group = "users";
      gui.theme = "black";
      openDefaultPorts = true;
      user = opts.userName;

      options = {
        listenAddresses = ["default"];
        minHomeDiskFree = {
          unit = "%";
          value = 1;
        };
        # :)
        urAccepted = -1;
      };
    };
  }
