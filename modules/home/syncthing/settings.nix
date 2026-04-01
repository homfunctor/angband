{config, ...}: let
  inherit (config.home) homeDirectory opts;
in {
  services.syncthing.settings = {
    configDir = "${homeDirectory}/.config/syncthing";
    extraOptions = [
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
