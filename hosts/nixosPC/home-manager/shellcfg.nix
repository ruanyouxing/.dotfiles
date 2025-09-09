{ lib, ... }:
{
  home.shellAliases = {
    nixos-switch = lib.mkForce "nh os switch --ask --hostname nixosPC /home/hungz/.dotfiles";
    nixos-boot = lib.mkForce "nh os boot --ask --hostname nixosPC /home/hungz/.dotfiles";
    nixos-test = lib.mkForce "nh os test --ask --hostname nixosPC /home/hungz/.dotfiles";
  };
}
