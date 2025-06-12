{pkgs, ...}: {
  home.packages = with pkgs; [
    slurp
    grim
    mpvpaper
    swww
    wtype
    wl-clipboard
    dunst
    swaylock
  ];
  wayland.windowManager.hyprland = {
    enable = true;
    systemd.enable = true;
    # package = null;
    # plugins = [];
    settings = {
      exec-once = "hyprland_startup.sh &";
      monitor = "Virtual-1,1920x1080@75,0x0,1";
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
      "$mainMod" = "SUPER";
      "altMod" = "ALT";
      bind = [
        "$altModSHIFT,Return,exec, foot"
        "$altModSHIFT,Q, exit"
        "$altMod, h, exec, scratchpad"
        "$altModSHIFT, h, exec, scratchpad -g"
        "$mainMod, W, killactive"
        "$mainMod, S, togglefloating"
        "$mainMod, F, fullscreen"
        "$mainMod, R, exec, rofi_wayland -modi drun -show drun -width 5"
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
        "$mainMod, semicolon,exec, rofi_wayland -modi emoji -show emoji"
        "$mainMod, 1, workspace, 1"
        "$mainMod, 2, workspace, 2"
        "$mainMod, 3, workspace, 3"
        "$mainMod, 4, workspace, 4"
        "$mainMod, 5, workspace, 5"
        "$mainMod, 6, workspace, 6"
        "$mainMod, 7, workspace, 7"
        "$mainMod, 8, workspace, 8"
        "$mainMod, 9, workspace, 9"
        "$mainMod, 0, workspace, 10"
        "$mainMod, SHIFT, 1, movetoworkspace, 1"
        "$mainMod, SHIFT, 2, movetoworkspace, 2"
        "$mainMod, SHIFT, 3, movetoworkspace, 3"
        "$mainMod, SHIFT, 4, movetoworkspace, 4"
        "$mainMod, SHIFT, 5, movetoworkspace, 5"
        "$mainMod, SHIFT, 6, movetoworkspace, 6"
        "$mainMod, SHIFT, 7, movetoworkspace, 7"
        "$mainMod, SHIFT, 8, movetoworkspace, 8"
        "$mainMod, SHIFT, 9, movetoworkspace, 9"
        "$mainMod, SHIFT, 0, movetoworkspace, 0"
      ];
      bindm = [
        "$mainMod, mouse:272, movewindow"
        "$mainmod, mouse:273, resizewindow"
      ];
    };
  };
}
