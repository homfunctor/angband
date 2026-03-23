{
  config,
  flake,
  lib,
  ...
}: {
  imports = [flake.modules.nixos.stylix];

  services.getty = lib.mkDefault {
    autologinOnce = true;
    autologinUser = config.nixos.opts.adminUser;
  };
}
