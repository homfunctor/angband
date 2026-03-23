# todo: check this works
{config, ...}: {
  services = {
    getty = {
      autologinOnce = false;
      autologinUser = null;
    };

    displayManager = {
      gdm.enable = true;
      autoLogin = {
        enable = true;
        user = config.nixos.opts.adminUser;
      };
    };
  };
}
