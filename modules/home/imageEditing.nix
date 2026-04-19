# imported by tier-work
{
  pkgs,
  ...
}: {
  home.packages = with pkgs; [gimp3];

  xdg.mimeApps = {
    associations.added."image/x-dds" = "gimp.desktop";
    defaultApplications."image/x-dds" = "gimp.desktop";
  };
}
