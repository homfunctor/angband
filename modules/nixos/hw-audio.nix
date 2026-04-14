# imported by tier-work
{
  config,
  flake,
  ...
}:
flake.lib.reqNTier config "work" {
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
