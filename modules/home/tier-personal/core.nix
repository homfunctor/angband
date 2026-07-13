# imported by hosts/<host>/users/<user>/settings/core.nix
{
  flake,
  inputs,
  pkgs,
  ...
}: {
  imports = with flake.modules.home; [
    discord
    gaming
    pika
    # shh, secret!
    inputs.utumno.modules.home.privateApps
  ];

  home = {
    opts.tier.personal.enabled = true;

    packages = with pkgs; [
      # baobab
      # picard
      # soundconverter
    ];
  };

  programs.niri.settings.environment = {
    PROTON_ENABLE_WAYLAND = "1";
    WINEDLLOVERRIDES = "winemenubuilder.exe=d";
  };
}
