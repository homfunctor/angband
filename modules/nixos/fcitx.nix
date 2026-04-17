# imported by tier-personal
{
  config,
  flake,
  pkgs,
  ...
}: {
  i18n.inputMethod = {
    enable = true;
    fcitx5 = {
      addons = [pkgs.fcitx5-gtk];
      waylandFrontend = true;
    };
    type = "fcitx5";
  };
}
