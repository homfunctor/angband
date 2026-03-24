# todo: streamline
{
  config,
  lib,
  ...
}:
lib.mkIf config.home.opts.tier.work.enabled {
  programs.niri.settings = {
    window-rules = [
      {
        matches = [{is-floating = true;}];
        shadow.enable = true;
      }
      {
        matches = [{app-id = "blueman-manager";}];
        open-floating = true;
      }
      {
        matches = [{app-id = "com.saivert.pwvucontrol";}];
        open-floating = true;
      }
      {
        matches = [{app-id = "nm-connection-editor";}];
        open-floating = true;
      }
      {
        matches = [{app-id = "org.gnome.Calculator";}];
        open-floating = true;
      }
      {
        matches = [{app-id = "org.gnome.Calendar";}];
        open-floating = true;
      }
      {
        matches = [{title = "^Picture-in-Picture$";}];
        open-floating = true;
      }
      {
        matches = [{app-id = "xdg-desktop-portal-gnome";}];
        open-floating = true;
      }
      {
        matches = [{app-id = "xdg-desktop-portal-gtk";}];
        open-floating = true;
      }
    ];
  };
}
