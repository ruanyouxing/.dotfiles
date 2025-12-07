#!/bin/sh
nixos-generate-config --show-hardware-config > ./hosts/dell5411/hardware-configuration.nix
nixos-install --flake .#dell5411
