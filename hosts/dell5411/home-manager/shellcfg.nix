{ lib, ... }:
{
  home.shellAliases = {
    nixos-switch = lib.mkForce "nh os switch --ask --hostname dell5411 /home/hungz/.dotfiles";
    nixos-boot = lib.mkForce "nh os boot --ask --hostname dell5411 /home/hungz/.dotfiles";
    nixos-test = lib.mkForce "nh os test --ask --hostname dell5411 /home/hungz/.dotfiles";
  };
}
