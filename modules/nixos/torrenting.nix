# imported by tier-personal
{
  inputs,
  pkgs,
  ...
}: {
  imports = [
    # provides open ports
    inputs.utumno.modules.nixos.torrenting
  ];

  environment.systemPackages = with pkgs; [
    proton-vpn
    qbittorrent
    wireguard-tools
  ];
}
