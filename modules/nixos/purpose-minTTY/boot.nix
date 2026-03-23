{
  lib,
  pkgs,
  ...
}: {
  console.earlySetup = true;

  boot = {
    consoleLogLevel = 3;

    initrd = {
      supportedFilesystems = ["ext4"];
      systemd.enable = true;
    };

    kernelPackages = pkgs.linuxPackages_latest;

    kernelParams = [
      "plymouth.use-simpledrm"
      "quiet"
      "rd.udev.log_level=3"
      "systemd.show_status=auto"
    ];

    loader = {
      efi.canTouchEfiVariables = true;
      systemd-boot.enable = lib.mkDefault true;
    };

    plymouth.enable = true;
  };
}
