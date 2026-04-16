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
upflake:
    nix flake update

# current flake config applied on next boot (uses sudo)
upboot:
    sudo nixos-rebuild boot --flake . --log-format internal-json |& nom --json

# --dry-activate (uses sudo)
upcheck:
    sudo nixos-rebuild dry-activate --flake .  --log-format internal-json |& nom --json

# --dry-activate  --show-trace (uses sudo)
uptrace:
    sudo nixos-rebuild dry-activate --flake . --log-format internal-json --show-trace |& nom --json

# violently destroy all remains of nixos channels (uses sudo)
purgech:
    sudo rm -rf /root/.nix-defexpr/channels && sudo rm -rf /nix/var/nix/profiles/per-user/root/channels
