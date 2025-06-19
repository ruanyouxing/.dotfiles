{pkgs}: let
  volume-path = toString ../../gui/quickshell/volume.qml;
in
  pkgs.writeShellScript "hyprland-startup" ''
    # wl-paste --type image --watch cliphist store \\
    # wl-paste --type text --watch cliphist store \\
    mpvpaper -o "no-audio loop" HDMI-A-1 ~/.dotfiles/backgrounds/wallpaper.mp4  & \\
    waybar  & \\
    fcitx5  & \\
    gammastep-indicator & \\
    hyprctl setcursor Sweet-Dark 15
    # swww-init.sh & \
  ''
