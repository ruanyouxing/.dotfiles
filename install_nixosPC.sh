#!/bin/sh
if [ ! -d "${HOME}/.config/nvim" ]; then
  git clone https://github.com/ruanyouxing/nvim ~/.config/nvim 
fi

nixos-generate-config --show-hardware-config > ./hosts/nixosPC/hardware-configuration.nix
sudo NIX_CONFIG='experimental-features = nix-command flakes' nixos-rebuild switch --flake .#nixosPC
