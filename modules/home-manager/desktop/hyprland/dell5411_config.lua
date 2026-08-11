local homeDir = os.getenv 'HOME'
hl.on('hyprland.start', function()
  hl.exec_cmd 'awww-init'
  hl.exec_cmd('awww img ' .. homeDir .. '/Downloads/wallpaper.jpg')
  hl.exec_cmd 'wl-paste --type image --watch cliphist store'
  hl.exec_cmd 'wl-paste --type text --watch cliphist store'
  hl.exec_cmd 'dbus-update-activation-environment --systemd --all '
  hl.exec_cmd 'waybar'
  hl.exec_cmd 'fcitx5'
  hl.exec_cmd 'flameshot'
  hl.exec_cmd 'snappy-switcher --daemon'
  hl.exec_cmd 'gammastep-indicator'
end)
hl.monitor {
  output = 'eDP-1',
  mode = '1920x1080@60',
  position = '0x0',
  scale = 1.2,
}
hl.window_rule {
  match = {
    -- title = "^.*([oO]pen|[sS]ave|[uU]pload|Volume Control|Preferences|Settings|Popup|.*Dialog.*|Bluetooth Devices).*$"
    class = 'xdg-desktop-portal-gtk',
  },
  size = { 800, 600 },
  center = true,
  float = true,
}
