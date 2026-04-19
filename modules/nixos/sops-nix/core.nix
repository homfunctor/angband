# imported by hosts/<host>/settings/core.nix
# 'mkdir -p ~/.config/sops/age'
# 'ssh-to-age -private-key -i ~/.ssh/id_ed25519 > ~/.config/sops/age/keys.txt'
{
  config,
  flake,
  inputs,
  pkgs,
  ...
}: {
  imports = [inputs.sops-nix.nixosModules.default];

  config = flake.lib.reqNTier config "niceTTY" {
    environment.systemPackages = with pkgs; [
      age
      sops
    ];

    sops = {
      age = {
        keyFile = "/home/${config.nixos.opts.adminUser}/.config/sops/age/keys.txt";
        sshKeyPaths = ["/etc/ssh/ssh_host_ed25519_key"];
      };

      defaultSopsFile = "${inputs.utumno}/secrets/secrets.yaml";
    };
  };
}
