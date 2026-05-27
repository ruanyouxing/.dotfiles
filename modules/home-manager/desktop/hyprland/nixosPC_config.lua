local homeDir = os.getenv 'HOME'
hl.on('hyprland.start', function()
  hl.exec_cmd 'wl-paste --type image --watch cliphist store'
  hl.exec_cmd 'wl-paste --type text --watch cliphist store'
  hl.exec_cmd 'awww-init'
  hl.exec_cmd('awww img ' .. homeDir .. '/.dotfiles/assets/backgrounds/wallpaper.jpg')
  -- hl.exec_cmd('mpvpaper -o "no-audio loop" HDMI-A-1 ~/.dotfiles/backgrounds/chihiro.mp4')
  hl.exec_cmd 'dbus-update-activation-environment --systemd --all '
  hl.exec_cmd 'waybar'
  hl.exec_cmd 'fcitx5'
  hl.exec_cmd 'snappy-switcher --daemon'
  hl.exec_cmd 'flameshot'
  hl.exec_cmd 'gammastep-indicator'
  -- hl.exec_cmd("qs - p ${volume-path}")
end)
hl.monitor {
  output = 'HDMI-A-1',
  mode = '1920x1080@74.97',
  position = '0x0',
  scale = 1,
}
hl.window_rule {
  match = {
    -- title = "^.*([oO]pen|[sS]ave|[uU]pload|Volume Control|Preferences|Settings|Popup|.*Dialog.*|Bluetooth Devices).*$"
    class = 'xdg-desktop-portal-gtk',
  },
  size = { 1200, 900 },
  center = true,
  float = true,
}
