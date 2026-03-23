{config, ...}: {
  services.syncthing.settings = {
    extraOptions = [
      "--data=${config.home.homeDirectory}"
      "--no-default-folder"
    ];

    gui.theme = "black";

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
