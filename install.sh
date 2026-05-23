#!/usr/bin/env bash

if [ "$#" -eq 0 ]; then
  echo "No parameters provided."
  echo "Usage: $0 [--livecd] --hosts <hostname> | --home-manager"
  exit 1
fi

LIVECD=false
HOST=""
RUN_HOME_MANAGER=false

while [[ "$#" -gt 0 ]]; do
  case $1 in
  --livecd)
    LIVECD=true
    shift 1
    ;;
  --hosts)
    HOST="$2"
    shift 2
    ;;
  --home-manager | -hm)
    RUN_HOME_MANAGER=true
    shift 1
    ;;
  *)
    echo "Invalid parameter: $1"
    exit 1
    ;;
  esac
done

if [[ -n "$HOST" ]]; then
  if [[ "$HOST" == "dell5411" || "$HOST" == "nixosPC" ]]; then

    nixos-generate-config --show-hardware-config >"./hosts/$HOST/hardware-configuration.nix"

    if [ "$LIVECD" = true ]; then
      echo "Running by nixos-install..."
      nixos-install --flake ".#$HOST"
    else
      echo "Running by nixos-rebuild switch..."
      sudo NIX_CONFIG='experimental-features = nix-command flakes' nixos-rebuild switch --flake ".#$HOST"
    fi

  else
    echo "No hosts named '$HOST'. Available hosts: dell5411, nixosPC"
    exit 1
  fi
fi

if [ "$RUN_HOME_MANAGER" = true ]; then
  echo "Updating home-manager..."
  home-manager switch --flake .#homeConfig
fi
