{pkgs, ...}: {
  imports = [
    ./waybar.nix
  ];
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
    extraConfig = ''
      monitor=,preferred,auto,auto
      exec-once = swww-init.sh & dbus-update-activation-environment --all & fcitx5 & waybar
      input {
          kb_layout = us
          kb_variant =
          kb_model =
          kb_options =
          kb_rules =

          follow_mouse = 1

          touchpad {
              natural_scroll = no
          }

          sensitivity = 0 # -1.0 - 1.0, 0 means no modification.
      }
      general {
          gaps_in = 5
          gaps_out = 20
          border_size = 3
          col.active_border = rgb(4825ac) rgb(73128a) 45deg
          col.inactive_border = rgba(595959aa)

          layout = dwindle
      }

      decoration {
          rounding = 10
          drop_shadow = yes
          shadow_range = 4
          shadow_render_power = 3
          col.shadow = rgba(1a1a1aee)
          active_opacity = 0.9
          inactive_opacity = 0.9
          fullscreen_opacity = 0.9
          blur {
            enabled = true
            size = 12
          }
      }

      animations {
          enabled = yes
          bezier = myBezier, 0.05, 0.9, 0.1, 1.05

          animation = windows, 1, 7, myBezier
          animation = windowsOut, 1, 7, default, popin 80%
          animation = border, 1, 10, default
          animation = fade, 1, 7, default
          animation = workspaces, 1, 6, default
      }
      dwindle {
          pseudotile = yes
          preserve_split = yes
      }
      master {
          new_is_master = true
      }
      gestures {
          workspace_swipe = off
      }
      device:epic mouse V1 {
          sensitivity = -0.5
      }
            $mainMod = SUPER
            $altMod = ALT
            bind = $altModSHIFT,Return,exec, kitty
            bind = $altModSHIFT,Q, exit
            bind = $altMod, h, exec, scratchpad
            bind = $altModSHIFT, h, exec, scratchpad -g
            bind = $mainMod, W, killactive
            bind = $mainMod, S, togglefloating
            bind = $mainMod, F, fullscreen
            bind = $mainMod, R, exec, rofi -modi drun -show drun -width 5
            bind = $mainMod, P, pseudo, # dwindle
            bind = $mainMod SHIFT, R, exec, kitty -e ranger
            bind = $mainMod SHIFT, S, exec, hyprshot -m region -o ~/Pictures
            bind = ,Print, exec, hyprshot -m output --clipboard-only
            bind = $mainMod, L, exec, betterlockscreen -l dimblur
            bind = $mainMod, J, togglesplit,
            bind = $mainMod, left, movefocus, l
            bind = $mainMod, right, movefocus, r
            bind = $mainMod, up, movefocus, u
            bind = $mainMod, down, movefocus, d
            bind = $mainMod, mouse_down, workspace, e+1
            bind = $mainMod, mouse_up, workspace, e-1
            bind = $mainMod, E, exec, Thunar
            bind = $mainMod, semicolon,exec, rofi -modi emoji -show emoji
            bindm = $mainMod, mouse:272, movewindow
            bindm = $mainMod, mouse:273, resizewindow
            ${builtins.concatStringsSep "\n" (builtins.genList (
          x: let
            ws = let
              c = (x + 1) / 10;
            in
              builtins.toString (x + 1 - (c * 10));
          in ''
            bind = $mainMod, ${ws}, workspace, ${toString (x + 1)}
            bind = $mainMod SHIFT, ${ws}, movetoworkspace, ${toString (x + 1)}
          ''
        )
        10)}
    '';
  };
}
