{
  xsession.windowManager.bspwm = {
    enable = true;
    monitors = {
      HDMI-0 = [
        "一"
        "二"
        "三"
        "四"
        "五"
      ];
    };
    settings = {
      border_width = 3;
      single_monocle = false;
      focus_follows_pointer = true;
      window_gap = 12;
      split_ratio = 0.5;
      borderless_monocle = true;
      pointer_modifier = "mod4";
      pointer_action1 = "move";
      pointer_action2 = "resize_side";
      pointer_action3 = "resize_corner";
      focused_border_color = "#BD93F9";
      normal_border_color = "#282A36";
      active_border_color = "#8BE0FD";
      presel_feedback_color = "#50FA7B";

    };
    startupPrograms = [
      "xsetroot -cursor_name left_ptr"
      "dunst"
      "~/.config/polybar/launch.sh"
      "picom --experimental-backends"
      "~/.fehbg"
      # "background-generate > /dev/null &"
      "flameshot"
      "sxhkd"
      "if ! pgrep -x ibus-daemon >/dev/null; then
      	ibus-setup
      fi"
    ];
  };
  services.sxhkd = {
    enable = true;
    keybindings = {
      "super + Escape" = "pkill -USR1 -x sxhkd";
      "alt + shift + Return" = "kitty";
      "super + e" = "Thunar";
      "ctrl + alt + p" = "~/.config/polybar/launch.sh";
      "super + r" = "rofi -modi drun -show drun -width 5";
      "super + l" = "betterlockscreen -l dimblur";
      "ctrl + alt + w" = "bspc rule -a \\* -o state=floating && nitrogen";
      "super + shift + r" = "kitty -e ranger";
      "ctrl + alt + c" = "code";
      "super + shift + s" = "flameshot gui";
      "alt + h" = "winhide --hide";
      "alt + shift +h" = "winhide --showall";
      "super + semicolon" = "rofi -modi emoji -show emoji";

      "super + alt + s" = "systemctl poweroff";
      "super + alt  + r" = "reboot";
      "alt + shift + {q,r}" = "bspc {quit,wm -r}";
      "super + w" = "bspc node -c";
      "super + m" = "bspc desktop -l next";
      "super + y" = "bspc node newest.marked.local -n newest.!automatic.local";
      "super + g" = "obs";
      "super + shift + t" = "bspc node focused -t \\~pseudo_tiled";
      "super + s" = "bspc node focused -t \\~floating";
      "super + f" = "bspc node focused -t \\~fullscreen";
      "super + t" = "bspc node focused -t \\~tiled";
      "super + ctrl + {m,x,y,z}" = "bspc node -g {marked,locked,sticky,private}";
      "super + {_,shift + }{Left,Down,Up,Right}" = "bspc node -{f,s} {west,south,north,east}";
      "super + {_,shift + }{h,j,k,l}" = "bspc node -{f,s} {west,south,north,east}";
      "super + {p,b,comma,period}" = "bspc node -f @{parent,brother,first,second}";
      "super + {_,shift + }c" = "bspc node -f {next,prev}.local";
      "super + bracket{left,right}" = "bspc desktop -f {prev,next}.local";
      "super + {grave,Tab}" = "bspc {node,desktop} -f last || zsh -c last-workspace.sh";
      "super + {o,i}" = "bspc wm -h off;bspc node {older,newer} -f;bspc wm -h on";
      "super + {_,shift + }{1-9,0}" = "bspc {desktop -f,node -d} '^{1-9,10}' --follow";
      "ctrl + alt + {Left,Right}" = "bspc node -d {prev,next} -f";
      "ctrl + alt + {h,l}" = "bspc node -d {prev,next} -f";
      # "super + ctrl + {Left,Down,Up,Right}" = "bspc node -p {west,south,north,east}";
      # "super + ctrl {h,j,k,l}" = "bspc node -p {west,south,north,east};"
      # "super + ctrl + {1-9}" = "bspc node -o 0.{1-9}";
      # "super + crrl + space" = "bpsc node -p cancel";
      # "super + ctrl + shift + space" = "bspc query -N -d | xargs -I id -n 1 bspc node id -p cancel"
      "super + alt + {Left,Down,Up,Right}" = "bspc node -z {left -20 0,bottom 0
      20,top 0 -20,right 20 0}";
      "super + alt + {h,j,k,l}" = "bspc node -z {left -20 0,bottom 0 20,top 0 -20,right 20 0}";
      "super + alt + shift + {Left,Down,Up,Right}" = "bspc node -z {right -20
      0,top 0 20,bottom 0 -20,left 20 0}";
      "super + alt + shfit + {h,j,k,l}" = "bspc node -z {right -20 0,top 0
      # 20,bottom 0 -20,left 20 0}";
      "super + {Left,Down,Up,Right}" = "bspc node -v {-20 0,0 20,0 -20,20 0}";
      "super + shift + g : {plus,minus}" = "bspc config window_gap $(( $(bspc
      config window_gap) {+,- 5}))";
    };
  };

}
