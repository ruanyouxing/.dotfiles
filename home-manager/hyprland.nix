{
  lib,
  pkgs,
  ...
}: let
  workspaceBinds = builtins.concatMap (w: let
    ws = toString w;
  in [
    "$mainMod, ${ws}, workspace , ${ws}"
    "$mainModSHIFT, ${ws}, movetoworkspace, ${ws}"
  ]) (lib.range 1 9);
in {
  home.packages = with pkgs; [
    slurp
    grim
    mpvpaper
    swww
    wtype
    wl-clipboard
    dunst
    swaylock
    swayimg
    (rofi-wayland.override
      {plugins = [pkgs.rofi-emoji-wayland];})
  ];
  xdg.portal = {
    enable = true;
    extraPortals = with pkgs; [
      xdg-desktop-portal-gtk
    ];
    config = {
      common = {
        default = ["hyprland" "gtk"];
      };
    };
  };
  wayland.windowManager.hyprland = {
    enable = true;
    package = null;
    # plugins = [];
    settings = {
      exec-once = [
        "hyprland_startup.sh"
      ];
      input = {
        kb_layout = "us";
        follow_mouse = 1;
        touchpad = {natural_scroll = false;};
        sensitivity = 0;
      };
      general = {
        gaps_in = 5;
        gaps_out = 20;
        border_size = 3;
        "col.active_border" = "rgb(4825ac) rgb(73128a) 45deg";
        "col.inactive_border" = "rgba(595959aa)";
        layout = "dwindle";
      };
      decoration = {
        rounding = 10;
        active_opacity = 0.9;
        inactive_opacity = 0.9;
        fullscreen_opacity = 0.9;
        blur = {
          enabled = true;
          size = 12;
        };
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
      "$mainMod" = "SUPER";
      "$altMod" = "ALT";
      bind =
        [
          "$altModSHIFT,Return,exec, kitty"
          "$altModSHIFT,Q, exit"
          "$altMod, h, exec, scratchpad"
          "$altModSHIFT, h, exec, scratchpad -g"
          "$mainMod, W, killactive"
          "$mainMod, S, togglefloating"
          "$mainMod, F, fullscreen"
          "$mainMod, R, exec, rofi -modi drun -show drun -width 5"
          "$mainMod, P, pseudo, # dwindle"
          "$mainMod SHIFT, R, exec, kitty -e ranger"
          "$mainMod SHIFT, S, exec, hyprshot -m region -o ~/Pictures"
          ",Print, exec, hyprshot -m output --clipboard-only"
          "$mainMod, L, exec, betterlockscreen -l dimblur"
          "$mainMod, J, togglesplit,"
          "$mainMod, left, movefocus, l"
          "$mainMod, right, movefocus, r"
          "$mainMod, up, movefocus, u"
          "$mainMod, down, movefocus, d"
          "$mainMod, mouse_down, workspace, e+1"
          "$mainMod, mouse_up, workspace, e-1"
          "$mainMod, E, exec, Thunar"
          "$mainMod, semicolon,exec, rofi -modi emoji -show emoji"
          ",XF86AudioRaiseVolume,exec, volume_control.sh up"
          ",XF86AudioLowerVolume,exec, volume_control.sh down"
          ",XF86AudioMute,exec, volume_control.sh mute"
        ]
        ++ workspaceBinds;
      bindm = [
        "$mainMod, mouse:272, movewindow"
        "$mainMod, mouse:273, resizewindow"
      ];
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
