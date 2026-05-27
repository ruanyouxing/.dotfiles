local SUPER = "SUPER"
local ALTSHIFT = "ALT + SHIFT"
local SUPERSHIFT = "SUPER + SHIFT"
local AltShift = function(key)
  return ALTSHIFT .. " + " .. key
end
local Super = function(key)
  return SUPER .. " + " .. key
end
local SuperShift = function(key)
  return SUPERSHIFT .. " + " .. key
end
local dsp = hl.dsp
local exec_cmd = dsp.exec_cmd
local keybinds = {
  { AltShift("Return"),  exec_cmd("kitty") },
  { AltShift("Q"),       exec_cmd("uwsm stop") },
  { AltShift("h"),       exec_cmd("scratchpad -g") },
  { Super("R"),          exec_cmd("rofi -modi drun -show drun -width 5") },
  { SuperShift("R"),     exec_cmd("kitty --class kitty-float -e yazi") },
  { "CTRL + Print",      exec_cmd("flameshot gui") },
  { "Print",             exec_cmd("flameshot full") },
  { Super("V"),          exec_cmd("cliphist list | rofi -dmenu -p 'Clipboard' | cliphist decode | wl-copy") },
  { Super("E"),          exec_cmd("Thunar") },
  { Super("semicolon"),  exec_cmd("rofi -modi emoji -show emoji") },
  { "ALT + F4",          exec_cmd("wlogout") },
  { "ALT + Tab",         exec_cmd("snappy-switcher next") },
  { AltShift("Tab"),     exec_cmd("snappy-switcher prev") },

  { Super("L"),          exec_cmd("lockandsleep") },

  { Super("W"),          dsp.window.close() },
  { Super("S"),          dsp.window.float({ action = "toggle" }) },
  { Super("F"),          dsp.window.fullscreen({ action = "toggle" }) },
  { Super("P"),          dsp.window.pseudo() },
  { Super("J"),          dsp.layout("togglesplit") },

  { Super("left"),       dsp.focus({ direction = "left" }) },
  { Super("right"),      dsp.focus({ direction = "right" }) },
  { Super("up"),         dsp.focus({ direction = "up" }) },
  { Super("down"),       dsp.focus({ direction = "down" }) },

  { SuperShift("left"),  function() exec_cmd("swapwindow", "l") end },
  { SuperShift("right"), function() exec_cmd("swapwindow", "r") end },
  { SuperShift("up"),    function() exec_cmd("swapwindow", "u") end },
  { SuperShift("down"),  function() exec_cmd("swapwindow", "d") end },

  -- { "VolumeUp",              exec_cmd("volume-control up"),                  { repeating = true } },
  -- { "VolumeDown",            exec_cmd("volume-control down"),                { repeating = true } },
  -- { "VolumeMute",            exec_cmd("volume-control mute"),                { locked = true } },
  -- { "MediaPlay",             exec_cmd("playerctl play-pause"),               { locked = true } },
  -- { "MediaPrevious",         exec_cmd("playerctl prev"),                     { locked = true } },
  -- { "MediaNext",             exec_cmd("playerctl next"),                     { locked = true } },
  -- { "MonBrightnessUp",       exec_cmd("brightnessctl s +5%"),                { repeating = true } },
  -- { "MonBrightnessDown",     exec_cmd("brightnessctl s -5%"),                { repeating = true } },


  { Super("mouse_down"), dsp.focus { workspace = "e+1" } },
  { Super("mouse_up"),   dsp.focus { workspace = "e-1" } },
  { Super("mouse:272"),  dsp.window.drag(),                              { mouse = true } },
  { Super("mouse:273"),  dsp.window.resize(),                            { mouse = true } },
}
for i = 1, 9 do
  hl.bind(SUPER .. " + " .. i, dsp.focus { workspace = i })
  hl.bind(SUPERSHIFT .. " + " .. i, dsp.window.move { workspace = i, follow = true })
end

hl.gesture({
  fingers = 3,
  direction = "right",
  action = function()
    dsp.focus { workspace = "e+1" }
  end
})
hl.gesture({
  fingers = 3,
  direction = "left",
  action = function()
    dsp.focus { workspace = "e-1" }
  end
})
hl.gesture({
  fingers = 3,
  direction = "vertical",
  action = function()
    exec_cmd("fullscreen")
  end
})
for _, bind in ipairs(keybinds) do
  local key = bind[1]
  local action = bind[2]
  local opts = bind[3]

  if opts then
    hl.bind(key, action, opts)
  else
    hl.bind(key, action)
  end
end
