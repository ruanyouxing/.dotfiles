require("bindings")
require("animation")
require("rules")
hl.on("hyprland.start", function()
  hl.exec_cmd("wl-paste --type image --watch cliphist store")
  hl.exec_cmd("wl-paste --type text --watch cliphist store")
  hl.exec_cmd('mpvpaper -o "no-audio loop" HDMI-A-1 ~/.dotfiles/backgrounds/chihiro.mp4')
  hl.exec_cmd("dbus-update-activation-environment --systemd --all ")
  hl.exec_cmd("waybar")
  hl.exec_cmd("fcitx5")
  hl.exec_cmd("flameshot")
  hl.exec_cmd("awww-init.sh")
  -- hl.exec_cmd("gammastep-indicator")
  -- hl.exec_cmd("qs - p ${volume-path}")
end)

hl.config({
  general = {
    border_size = 3,
    -- active_border = "rgba(3DDCFFee) rgba(A78BFAee) 90deg",
    col = {
      active_border = { colors = { "rgba(3DDCFFee)", "rgba(A78BFAee)", angle = 90 } },
      inactive_border = "rgba(595959ff)",
    },
    gaps_in = 5,
    gaps_out = 20,
    layout = "master"
  },
  decoration = {
    rounding = 10,
    rounding_power = 3,
    active_opacity = 0.9,
    fullscreen_opacity = 0.9,
    inactive_opacity = 0.9,
    blur = {
      enabled = true,
      passes = 3,
      size = 10
    }
  },
  dwindle = {
    preserve_split = true,
    -- pseudotile = true
  },
  master = {
    mfact = 0.55,
    new_status = "slave",
    orientation = "left"
  },
  input = {
    follow_mouse = 1,
    kb_layout = "us",
    sensitivity = 0,
    touchpad = {
      natural_scroll = true
    }
  },
  debug = {
    disable_logs = false,
    enable_stdout_logs = true
  },
  ecosystem = {
    no_update_news = true
  },
  xwayland = {
    force_zero_scaling = true
  }
})
