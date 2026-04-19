# imported by hosts/<host>/users/<user>/settings/core.nix
{
  config,
  flake,
  inputs,
  pkgs,
  ...
}: {
  imports = with flake.modules.home; [
    apotheosis
    civ5-map-image
    discord
    gaming
    ironyModManager
    pika

    inputs.utumno.modules.home.privateApps
  ];

  home = {
    opts.tier.personal.enabled = true;

    packages = with pkgs; [
      baobab
      picard
      soundconverter

      (lib.mkIf
        config.home.opts.quirk.strawberry.enable
        strawberry)
    ];
  };

  programs.niri.settings.environment = {
    PROTON_ENABLE_WAYLAND = "1";
    WINEDLLOVERRIDES = "winemenubuilder.exe=d";
  };
}
