{
  lib,
  pkgs,
  ...
}:
let
  workspaceBinds = builtins.concatMap (
    w:
    let
      ws = toString w;
    in
    [
      "SUPER, ${ws}, workspace , ${ws}"
      "SUPERSHIFT, ${ws}, movetoworkspace, ${ws}"
    ]
  ) (lib.range 1 9);
  float_titles = "([oO]pen|[sS]ave|[uU]pload|Volume Control|Preferences|Settings|Popup|.*Dialog.*|Bluetooth Devices)";
  inherit (import ./scripts { inherit pkgs; }) volume-control hyprland-startup lockAndSleep;
in
{
  imports = [
    ./waybar.nix
    ./wlogout.nix
    ./extras
  ];
  home.packages = with pkgs; [
    slurp
    grim
    mpvpaper
    swww
    wtype
    wl-clipboard
    dunst
    swayimg
    (rofi-wayland.override { plugins = [ pkgs.rofi-emoji-wayland ]; })
    foot
  ];
  xdg.portal = {
    enable = true;
    extraPortals = with pkgs; [
      xdg-desktop-portal-gtk
    ];
    config = {
      common = {
        default = [
          "hyprland"
          "gtk"
        ];
      };
    };
  };
  wayland.windowManager.hyprland = {
    enable = true;
    package = null;
    # plugins = [];
    settings = {
      exec-once = [
        "${hyprland-startup}"
      ];
      input = {
        kb_layout = "us";
        follow_mouse = 1;
        touchpad = {
          natural_scroll = false;
        };
        sensitivity = 0;
      };
      general = {
        gaps_in = 5;
        gaps_out = 20;
        border_size = 3;
        "col.active_border" = "rgba(3DDCFFee) rgba(A78BFAee) 90deg";
        "col.inactive_border" = "rgba(595959aa)";
        layout = "master";
      };
      master = {
        mfact = 0.55;
        new_status = "slave";
        orientation = "left";
      };
      decoration = {
        rounding = 10;
        rounding_power = 3;
        active_opacity = 0.9;
        inactive_opacity = 0.9;
        fullscreen_opacity = 0.9;
        blur = {
          enabled = true;
          size = 10;
          passes = 3;
        };
        layerrule = [
          "blur,waybar"
          "blur,rofi"
        ];
      };
      debug = {
        disable_logs = false;
        enable_stdout_logs = true;
      };
      animations = {
        enabled = true;
        bezier = "myBezier, 0.05, 0.9, 0.1, 1.05";

        animation = [
          "windows, 1, 7, myBezier"
          "windowsOut, 1, 7, default, popin 80%"
          "border, 1, 10, default"
          "fade, 1, 7, default"
          "workspaces, 1, 6, default"
        ];
      };
      dwindle = {
        pseudotile = true;
        preserve_split = true;
      };
      gestures = {
        workspace_swipe = false;
      };
      xwayland.force_zero_scaling = true;
      windowrulev2 = [
        "float, title:^.*${float_titles}.*$"
        "size 800 600, title:^.*${float_titles}.*$"
        "float,title:^(Picture-in-Picture)$"
        "size 640 360, title:^(Picture-in-Picture)$"
        "move 25 695, title:^(Picture-in-Picture)$"
        "float, class:kitty-float"
        "size 1200 800, class:kitty-float"
        "center class:kitty-float"
        "float, title:mpv"
        "size 960 540, title:mpv"
        "center title:mpv"
      ];

      bind = [
        "ALTSHIFT,Return,exec, kitty"
        "ALTSHIFT,Q, exec, uwsm stop"
        "ALTSHIFT, h, exec, scratchpad -g"
        "SUPER, W, killactive"
        "SUPER, S, togglefloating"
        "SUPER, F, fullscreen"
        "SUPER, R, exec, rofi -modi drun -show drun -width 5"
        "SUPER, P, pseudo, # dwindle"
        "SUPER SHIFT, R, exec, kitty --class kitty-float -e ranger"
        "Ctrl, Print, exec, flameshot gui"
        ",Print, exec, flameshot full"
        "SUPER, L, exec, betterlockscreen -l dimblur"
        "SUPER, J, togglesplit,"
        "SUPER, left, movefocus, l"
        "SUPER, right, movefocus, r"
        "SUPER, up, movefocus, u"
        "SUPER, down, movefocus, d"
        "SUPER SHIFT, left, swapwindow, l"
        "SUPER SHIFT, right, swapwindow, r"
        "SUPER SHIFT, up, swapwindow, u"
        "SUPER SHIFT, down, swapwindow, d"
        "SUPER, mouse_down, workspace, e+1"
        "SUPER, mouse_up, workspace, e-1"
        "SUPER, E, exec, Thunar"
        "SUPER, L, exec, ${lockAndSleep}"
        "SUPER, semicolon,exec, rofi -modi emoji -show emoji"
        "ALT,F4, exec, wlogout"
        ",XF86AudioRaiseVolume,exec, ${volume-control} up"
        ",XF86AudioLowerVolume,exec,${volume-control} down"
        ",XF86AudioMute,exec, ${volume-control} mute"
        ",XF86AudioPlay, exec, playerctl play-pause"
        ",XF86AudioPrev, exec, playerctl prev"
        ",XF86AudioNext, exec, playerctl next"
      ] ++ workspaceBinds;
      bindm = [
        "SUPER, mouse:272, movewindow"
        "SUPER, mouse:273, resizewindow"
      ];
      # misc = {
      #   mouse_move_enables_dpms = true;
      #   # key_press_enables_dpms = true;
      # };
    };

    # monitor=Virtual-1,1920x1080@75,0x0,1
    extraConfig = ''
      monitor=HDMI-A-1,1920x1080@74.97,0x0,1
    '';
  };
  services.gammastep = {
    enable = true;
    provider = "manual";
    latitude = 12.0;
    longitude = 107.0;
  };
}
