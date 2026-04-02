these are the steps i use when installing NixOS. there may be better ways, easier ways, but this is how i do it.

# deploy ssh keys

1. nix-shell -p cryptsetup
2. sudo cryptsetup luksOpen /dev/sdXN tmp
3. mkdir ~/tmp
4. sudo mount /dev/mapper/tmp ~/tmp
5. cd ~/tmp/HOST/USER
6. mkdir ~/.ssh
7. cp KEYS ~/.ssh/
8. cd ..
9. sudo cp keys /etc/ssh/
10. sudo umount ~/tmp
11. sudo cryptsetup luksClose /dev/mapper/tmp
12. chmod 600 ~/.ssh/id_ed25519\*
13. sudo chmod 600 /etc/ssh/ssh_host\*

# grab flake

1. nix-shell -p git
2. git clone git@github.com:USER/FLAKE.git
3. cd ~/FLAKE

# update flake

nix --experimental-features "flakes nix-command" flake update

# format with disko

sudo nix --experimental-features "flakes nix-command" run github:nix-community/disko -- --mode destroy,format,mount modules/nixos/disko-HOST.nix

# install with flake

1. (make sure purpose is set to minTTY)
2. sudo nixos-install --flake .#HOST

# copy ssh keys

1. sudo mkdir /mnt/home/USER/.ssh
2. sudo cp ~/.ssh/id_ed25519\* /mnt/home/USER/.ssh/

# set USER password

1. sudo nixos-enter
2. chown USER -R /home/USER/.ssh
3. passwd USER

# post-install

1. git clone git@github.com:USER/FLAKE.git
2. cd FLAKE
3. nix-shell -p vim

4. upgrade to niceTTY
5. enable stylix in USER/settings/core.nix
6. install sops, lanzaboote
7. if all good, upgrade to work
8. if applicable, upgrade to personal
