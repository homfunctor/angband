# imported by wm-niri
{
  config,
  flake,
  ...
}:
flake.lib.reqNTier config "work" {
  services = {
    # swap from getty autologin to gdm autologin
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
