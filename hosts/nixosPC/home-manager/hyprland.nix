{
  lib,
  pkgs,
  ...
}:
let
  volume-path = toString ../../../modules/home-manager/gui/quickshell/volume.qml;
  desktop-startup = pkgs.writeShellScript "hyprland-startup" ''
    wl-paste --type image --watch cliphist store \\
    wl-paste --type text --watch cliphist store \\
    mpvpaper -o "no-audio loop" HDMI-A-1 ~/.dotfiles/backgrounds/chihiro.mp4  & \
    dbus-update-activation-environment --systemd --all & \
    waybar  & \
    fcitx5  & \
    flameshot & \
    qs -p "${volume-path}" & \
    # gammastep-indicator & \
    # swww-init.sh & \
  '';
in
{
  wayland.windowManager.hyprland.extraConfig = lib.mkForce ''
    monitor=HDMI-A-1,1920x1080@74.97,0x0,1
  '';
  services.gammastep.enable = lib.mkForce false;

  wayland.windowManager.hyprland.settings.exec-once = lib.mkForce [ "${desktop-startup}" ];
}
