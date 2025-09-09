{ pkgs, lib,... }:
let
  hyprland-startup = pkgs.writeShellScript "laptop-startup" ''
    # wl-paste --type image --watch cliphist store \\
    # wl-paste --type text --watch cliphist store \\
    if pgrep -x swww-daemon  > /dev/null
    then
      swww kill
    fi
    swww-daemon & \
    swww img ~/.dotfiles/backgrounds/laptop_background.jpg \
    dbus-update-activation-environment --systemd --all & \
    waybar  & \
    fcitx5  & \
    flameshot & \
    gammastep-indicator & \
    # hyprlock & \
    # swww-init.sh & \
  '';
in
{
  wayland.windowManager.hyprland = {
    settings.exec-once = lib.mkForce [
      "${hyprland-startup}"
    ];
    settings.input.touchpad.natural_scroll = lib.mkForce true;
    extraConfig = ''
      monitor=eDP-1,1920x1080@60,0x0,1.2
    '';
  };
}
