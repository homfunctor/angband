{
  config,
  lib,
  osConfig,
  ...
}: let
  cfg = osConfig.nixos.opts.stylix;
in {
  programs.niri.settings = lib.mkIf cfg.enable {
    cursor = with config.stylix.cursor; {
      inherit size;
      theme = name;
    };

    layout.border = with config.lib.stylix.colors.withHashtag; {
      enable = true;
      active.color = base07;
      inactive.color = base02;
      urgent.color = base08;
    };
  };
}
