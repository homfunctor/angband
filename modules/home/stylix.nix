{
  lib,
  osConfig,
  ...
}: let
  cfg = osConfig.nixos.opts.stylix;
in
  lib.mkIf cfg.enable {
    stylix = {
      enable = true;
      autoEnable = true;
    };
  }
