#!/bin/sh

if [ ! -d "${HOME}/.config/home-manager/" ]; then
  ln -s "${HOME:?}/.dotfiles/home-manager" "${HOME:?}/.config/home-manager"
fi
if [ ! -d "${HOME}/.config/nvim" ]; then
  git clone https://github.com/ruanyouxing/nvim ~/.config/nvim 
fi

nixos-generate-config --show-hardware-config > ./nixos/hardware-configuration.nix
sudo NIX_CONFIG='experimental-features = nix-command flakes' nixos-rebuild switch --flake .#nixos
sudo nixos-rebuild boot --flake .#nixos
