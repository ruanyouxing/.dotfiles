{pkgs}:
pkgs.writeShellScript "hyprland-startup" ''
  wl-paste --type image --watch cliphist store \\
  wl-paste --type text --watch cliphist store \\
  mpvpaper -o "no-audio loop" HDMI-A-1 ~/Videos/wallpaper.mp4 & \\
  waybar & \\
  fcitx5 & \\
  gammastep-indicator & \\
  dbus-update-activation-environment --all & \\
  hyprctl setcursor Sweet-Dark 15
  # swww-init.sh & \
''
