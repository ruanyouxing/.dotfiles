require("bindings")
require("animation")
require("rules")

local hostName = os.getenv("HOSTNAME")
if hostName == "dell5411" then
  require("dell5411_config")
elseif hostName == "nixosPC" then
  require("nixosPC_config")
end
local opts = {
  general = {
    border_size = 3,
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
}
if hostName == "dell5411" then
  opts.input.touchpad.natural_scroll = false;
end
hl.config(opts)
