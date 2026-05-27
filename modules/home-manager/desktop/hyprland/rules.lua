---@diagnostic disable:undefined-global

hl.layer_rule({
  match = {
    namespace = "^(waybar|rofi|kitty)$",
    class = "^(rofi|kitty|kitty-float)$"
  },
  blur = true,
})
hl.window_rule({
  match = {
    -- title = "^.*([oO]pen|[sS]ave|[uU]pload|Volume Control|Preferences|Settings|Popup|.*Dialog.*|Bluetooth Devices).*$"
    class = "xdg-desktop-portal-gtk",
  },
  size = { 800, 600 },
  center = true,
  float = true,
})


hl.window_rule({
  match = {
    title = "^(Picture-in-Picture)$",
  },
  float = true,
  size = { 640, 360 },
  move = { 25, 695 }
})


hl.window_rule({
  match = {
    class = "^(mpv)$",
  },
  center = true,
  size = { 960, 540 }
})
hl.window_rule({
  match = {
    class = "^(kitty-float)$",
  },
  float = true,
  size = { 1200, 800 },
  center = true,
})


hl.window_rule({
  match = {
    class = "^(flameshot)$",
  },
  fullscreen_state = "3 3",
  move = { 0, 0 },
  pin = true,
})
