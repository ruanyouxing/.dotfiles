{
  pkgs,
  lib,
  # inputs,
  ...
}:
let
  hyprland-startup = pkgs.writeShellScript "laptop-startup" ''
    wl-paste --type image --watch cliphist store & \
    wl-paste --type text --watch cliphist store & \
    if pgrep -x swww-daemon  > /dev/null
    then
      swww kill
    fi
    swww-daemon & \
    swww img /home/hungz/.dotfiles/backgrounds/wallpapaer2.jpeg & \
    dbus-update-activation-environment --systemd --all & \
    waybar  & \
    fcitx5  & \
    flameshot & \
    gammastep-indicator & \
    # hyprlock & \
  '';
in
{
  home.packages = [
    pkgs.brightnessctl
  ];
  wayland.windowManager.hyprland = {
    package = null;
    settings = {
      exec-once = lib.mkForce [
        "${hyprland-startup}"
      ];
      input.touchpad.natural_scroll = lib.mkForce true;
      gestures = {
        # workspace_swipe_distance = 100;
      };
      gesture = [
        "3,right,workspace, e+1"
        "3,left, workspace, e-1"
        "3,vertical, fullscreen "
      ];
      bind = [
        ", XF86MonBrightnessUp, exec, brightnessctl s +5%"
        ", XF86MonBrightnessDown, exec, brightnessctl s -5%"
      ];
    };
    extraConfig = ''
      monitor=eDP-1,1920x1080@60,0x0,1.2
    '';
  };
  services.hypridle.settings.listener = lib.mkForce [ ];
}
