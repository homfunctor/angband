# imported by tier-work
{
  config,
  flake,
  pkgs,
  ...
}:
flake.lib.reqHTier config "work" {
  home.packages = with pkgs; [gimp3];

  xdg.mimeApps = {
    associations.added."image/x-dds" = "gimp.desktop";
    defaultApplications."image/x-dds" = "gimp.desktop";
  };
}
