{
  config,
  lib,
  ...
}:
lib.mkIf config.nixos.opts.tier.work.enabled {
  services.pipewire = {
    enable = true;

    alsa = {
      enable = true;
      support32Bit = true;
    };

    pulse.enable = true;
    wireplumber.enable = true;
  };
}
