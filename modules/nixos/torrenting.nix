# imported by tier-personal
{
  config,
  flake,
  inputs,
  pkgs,
  ...
}: {
  imports = [
    # provides open ports
    inputs.utumno.modules.nixos.torrenting
  ];

  environment = flake.lib.reqNTier config "personal" {
    systemPackages = with pkgs; [
      proton-vpn
      qbittorrent
      wireguard-tools
    ];
  };
}
