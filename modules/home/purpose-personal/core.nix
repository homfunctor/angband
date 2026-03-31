{
  flake,
  inputs,
  pkgs,
  ...
}: {
  imports = with flake.modules.home; [
    apotheosis
    discord
    gaming
    ironyModManager
    inputs.utumno.modules.home.privateApps
  ];

  home = {
    opts.tier.personal.enabled = true;

    packages = with pkgs; [
      baobab
      picard
      soundconverter
      strawberry
    ];
  };

  programs.niri.settings.environment = {
    PROTON_ENABLE_WAYLAND = "1";
    WINEDLLOVERRIDES = "winemenubuilder.exe=d";
  };
}
