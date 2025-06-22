{ pkgs }:
let
  volume-path = toString ../../gui/quickshell/volume.qml;
in
pkgs.writeShellScript "hyprland-startup" ''
  # wl-paste --type image --watch cliphist store \\
  # wl-paste --type text --watch cliphist store \\
  mpvpaper -o "no-audio loop" HDMI-A-1 ~/.dotfiles/backgrounds/wallpaper.mp4  & \
  dbus-update-activation-environment --systemd --all & \
  waybar  & \
  fcitx5  & \
  qs -p "${volume-path}" & \
  gammastep-indicator & \
  # hypridle & \
  hyprctl setcursor Sweet-Dark 15
  # swww-init.sh & \
''
