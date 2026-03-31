these are the steps i use when installing NixOS. there may be better ways, easier ways, but this is how i do it.

# deploy ssh keys

nix-shell -p cryptsetup
sudo cryptsetup luksOpen /dev/sdX4 tmp
mkdir ~/tmp
sudo mount /dev/mapper/tmp ~/tmp
cd ~/tmp/HOST/USER
mkdir ~/.ssh
cp keys ~/.ssh/
cd ..
sudo cp keys /etc/ssh/
cd ~
sudo umount ~/tmp
sudo cryptsetup luksClose /dev/mapper/tmp
chmod 600 ~/.ssh/id_ed25519*
sudo chmod 600 /etc/ssh/ssh_host*

# grab flake

nix-shell -p git
git clone git@github.com:USER/FLAKE.git
cd ~/FLAKE

# update flake

nix --experimental-features "flakes nix-command" flake update

# format with disko

sudo nix --experimental-features "flakes nix-command" run github:nix-community/disko -- --mode destroy,format,mount modules/nixos/disko-HOST.nix

# install with flake

(make sure purpose is set to minTTY)
sudo nixos-install --flake .#HOST

# copy ssh keys

sudo mkdir /mnt/home/USER/.ssh
sudo cp ~/.ssh/id_ed25519\* /mnt/home/USER/.ssh/

# set USER password

sudo nixos-enter
chown USER -R /home/USER/.ssh
passwd USER

# done

exit
shutdown now

# post-install

git clone git@github.com:USER/FLAKE.git
cd FLAKE
nix-shell -p vim

- upgrade to niceTTY
- enable stylix in USER/settings/core.nix
- install sops, lanzaboote
- if all good, upgrade to work
- if applicable, upgrade to personal
