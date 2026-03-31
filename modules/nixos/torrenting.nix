{
  config,
  inputs,
  lib,
  pkgs,
  ...
}: {
  imports = [
    # provides open ports
    inputs.utumno.modules.nixos.torrenting
  ];

  config = lib.mkIf config.nixos.opts.tier.personal.enabled {
    environment.systemPackages = with pkgs; [
      proton-vpn
      qbittorrent
      wireguard-tools
    ];
  };
}
