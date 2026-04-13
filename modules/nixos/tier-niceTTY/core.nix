{
  config,
  lib,
  ...
}: {
  nixos.opts.tier.niceTTY.enabled = true;

  # niceTTY niceness: autologin via getty
  # mkDefault as it is disabled for tier.work and beyond
  services.getty = lib.mkDefault {
    autologinOnce = true;
    autologinUser = config.nixos.opts.adminUser;
  };
}
