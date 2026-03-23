{
  flake,
  pkgs,
  ...
}: {
  imports = with flake.modules.nixos; [
    wm-niri
  ];

  nixos.opts.wm.niri = {
    appBinds.enable = true;
    pkg = pkgs.niri-stable;
  };
}
