{
  config,
  lib,
  pkgs,
  ...
}:
lib.mkIf config.nixos.opts.tier.personal.enabled {
  i18n.inputMethod = {
    enable = true;
    fcitx5 = {
      addons = [pkgs.fcitx5-gtk];
      waylandFrontend = true;
    };
    type = "fcitx5";
  };
}
