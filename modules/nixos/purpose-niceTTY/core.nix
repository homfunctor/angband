{
  config,
  lib,
  ...
}: {
  nixos.opts.tier.niceTTY.enabled = true;

  services.getty = lib.mkDefault {
    autologinOnce = true;
    autologinUser = config.nixos.opts.adminUser;
  };
}
