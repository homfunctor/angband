{pkgs, ...}: {
  environment.systemPackages = [pkgs.simple-scan];

  hardware.sane.enable = true;

  services.printing = {
    enable = true;
    drivers = with pkgs; [
      cnijfilter2
    ];
  };
}
