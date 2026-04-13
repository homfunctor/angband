{
  config,
  lib,
  ...
}: {
  users.users = lib.genAttrs config.nixos.opts.userNames (
    user: {
      description = user;
      extraGroups = [
        "input"
        "kvm"
        "libvirtd"
        "networkmanager"
        "plugdev"
        "video"
        "wheel"
      ];
      isNormalUser = true;
    }
  );
}
