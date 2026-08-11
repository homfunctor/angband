# imported by hosts/<host>/users/<user>/settings/core.nix
{
  config,
  flake,
  pkgs,
  ...
}:
flake.lib.reqHTier config "work" {
  home.packages = with pkgs; [
    # ffmpeg-full
    vivaldi
    vivaldi-ffmpeg-codecs
  ];
}
