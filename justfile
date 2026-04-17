default:
    @just --list

# flake check
fc:
    nix flake check

# collect garbage
clean:
    nix-collect-garbage -d  --log-format internal-json |& nom --json

# format
nf:
    nix fmt

# update to current flake config (uses sudo)
update:
    sudo nixos-rebuild switch --flake . --log-format internal-json |& nom --json

# update flake inputs
inputs:
    nix flake update

# update utumno
utumno:
    nix flake update utumno

# current flake config applied on next boot (uses sudo)
boot:
    sudo nixos-rebuild boot --flake . --log-format internal-json |& nom --json

# --dry-activate (uses sudo)
check:
    sudo nixos-rebuild dry-activate --flake .  --log-format internal-json |& nom --json

# --dry-activate  --show-trace (uses sudo)
trace:
    sudo nixos-rebuild dry-activate --flake . --log-format internal-json --show-trace |& nom --json

# violently destroy all remains of nixos channels (uses sudo)
purge:
    sudo rm -rf /root/.nix-defexpr/channels && sudo rm -rf /nix/var/nix/profiles/per-user/root/channels
