{
  config,
  lib,
  pkgs,
  ...
}: let
  cfg = config.nixos.opts.stylix;
in
  lib.mkIf cfg.enable {
    stylix.cursor = {
      name = "Nordzy-cursors-white";
      package = pkgs.nordzy-cursor-theme;
      size = 32;
    };
  }
