{ lib, ... }:
{
  wayland.windowManager.hyprland.extraConfig = ''
    monitor=eDP-1,1920x1080@60,0x0,1.2
  '';
  home.shellAliases = {
    nixos-switch = lib.mkForce "nh os switch --ask --hostname dell5411 /home/hungz/.dotfiles";
    nixos-boot = lib.mkForce "nh os boot --ask --hostname dell5411 /home/hungz/.dotfiles";
    nixos-test = lib.mkForce "nh os test --ask --hostname dell5411 /home/hungz/.dotfiles";
  };
}
