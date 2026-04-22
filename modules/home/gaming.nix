# imported by tier-personal
{pkgs, ...}: let
  # to get around the issue:
  #   warning: wine cmd.exe /c echo '%AppData%' returned empty string, error message ""
  winetricked = pkgs.writeShellScriptBin "winetricks" ''
    export PATH="${pkgs.wineWow64Packages.stable}/bin:${pkgs.winetricks}/bin:$PATH"
    exec ${pkgs.winetricks}/bin/winetricks "$@"
  '';
in {
  home = {
    packages = with pkgs; [
      hashdeep
      heroic
      ludusavi
      lutris
      protonplus
      steamcmd
      umu-launcher
      wineWow64Packages.fonts
      wineWow64Packages.waylandFull
      winetricked
      xrandr
    ];
  };
}
