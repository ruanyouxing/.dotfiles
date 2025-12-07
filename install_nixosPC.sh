#!/bin/sh
nixos-generate-config --show-hardware-config > ./hosts/nixosPC/hardware-configuration.nix
nixos-install --flake .#nixosPC
# sudo NIX_CONFIG='experimental-features = nix-command flakes' nixos-rebuild switch --flake .#nixosPC
