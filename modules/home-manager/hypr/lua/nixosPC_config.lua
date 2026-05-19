hl.on("hyprland.start", function()
  hl.exec_cmd("wl-paste --type image --watch cliphist store")
  hl.exec_cmd("wl-paste --type text --watch cliphist store")
  hl.exec_cmd('mpvpaper -o "no-audio loop" HDMI-A-1 ~/.dotfiles/backgrounds/chihiro.mp4')
  hl.exec_cmd("dbus-update-activation-environment --systemd --all ")
  hl.exec_cmd("waybar")
  hl.exec_cmd("fcitx5")
  hl.exec_cmd("flameshot")
  -- hl.exec_cmd("awww-init.sh")
  -- hl.exec_cmd("gammastep-indicator")
  -- hl.exec_cmd("qs - p ${volume-path}")
end)
hl.monitor({
  output = "HDMI-A-1",
  mode = "1920x1080@74.97",
  position = "0x0",
  scale = 1,
})
