# imported by hosts/<host>/settings/core.nix
{
  config,
  flake,
  pkgs,
  ...
}: let
  inherit (config.nixos.opts) adminUser;
in
  flake.lib.reqNTier config "personal" {
    environment.systemPackages = with pkgs; [
      virt-manager
      virtio-win
    ];

    networking.firewall.trustedInterfaces = ["virbr0"];

    users.users.${adminUser}.extraGroups = ["libvirtd"];

    virtualisation.libvirtd = {
      enable = true;
      onShutdown = "shutdown";
      qemu = {
        package = pkgs.qemu_kvm;
        runAsRoot = true;
        vhostUserPackages = [pkgs.virtiofsd];
      };
    };
  }
