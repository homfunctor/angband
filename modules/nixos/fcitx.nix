# imported by tier-personal
{pkgs, ...}: {
  i18n.inputMethod = {
    enable = true;
    fcitx5 = {
      addons = [pkgs.fcitx5-gtk];
      waylandFrontend = true;
    };
    type = "fcitx5";
  };
}
