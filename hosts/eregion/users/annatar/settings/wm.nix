# useful defaults to keep in mind
#   touchpad:
#   two fingers scroll up/down
#   three fingers move left/right between columns
#     or up/down between workspaces
{flake, ...}: {
  imports = with flake.modules.home; [
    wm-niri
    wm-niri-workLaptop
  ];

  home.opts.wm.niri.screencast.enable = true;
}
