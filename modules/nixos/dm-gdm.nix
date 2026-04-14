# imported by wm-niri
{
  config,
  lib,
  ...
}: let
  enabled =
    config.nixos.opts.tier.work.enabled
    && config.nixos.opts.wm.niri.enable;
in
  lib.mkIf enabled {
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
