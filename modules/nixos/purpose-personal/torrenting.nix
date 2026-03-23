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
    protonvpn-gui
    qbittorrent
    wireguard-tools
  ];
}
