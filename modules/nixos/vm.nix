# imported by hosts/<host>/settings/core.nix
{
  config,
  flake,
  pkgs,
  ...
}:
flake.lib.reqNTier config "personal" {
  environment.systemPackages = with pkgs; [
    virt-manager
    virtio-win
  ];

  networking.firewall.trustedInterfaces = ["virbr0"];

  virtualisation.libvirtd = {
    enable = true;
    onShutdown = "shutdown";
    qemu = {
      package = pkgs.qemu_kvm;
      runAsRoot = true;
      swtpm.enable = true;
      vhostUserPackages = [pkgs.virtiofsd];
    };
  };
}
