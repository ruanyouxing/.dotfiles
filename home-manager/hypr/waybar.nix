{
  pkgs,
  inputs,
  ...
}: let
  lizzy = pkgs.callPackage ./scripts/lizzy.nix {
    naersk =
      pkgs.callPackage inputs.naersk {};
  };
  powermenu = pkgs.callPackage ./scripts/powermenu.nix {};
  music-bar = pkgs.callPackage ./scripts/music-bar.nix {};
in {
  home.packages = with pkgs; [
    spotifyd
    playerctl
  ];
  programs.waybar = {
    enable = true;
    package = pkgs.waybar.overrideAttrs (oldAttrs: {
      mesonFlags = oldAttrs.mesonFlags ++ ["-Dexperimental=true"];
    });
    settings = {
      mainBar = {
        height = 30;
        margin-top = 6;
        margin-left = 10;
        margin-bottom = 0;
        margin-right = 10;
        spacing = 5;
        modules-left = [
          "custom/launcher"
          # "cpu"
          # "memory"
          "hyprland/workspaces"
          "hyprland/window"
        ];
        modules-center = ["custom/music" "custom/music-bar"];
        modules-right = [
          "tray"
          "pulseaudio"
          "network"
          "clock"
          "custom/power-menu"
        ];
        "hyprland/workspaces" = {
          format = "{icon}";
          format-icons = {
            "1" = "";
            "2" = "";
            "3" = "";
            "4" = "";
            "5" = "";
            "6" = "";
            "7" = "";
            "8" = "";
            "9" = "";
            "10" = "";
            "urgent" = "";
            "active" = "";
            "default" = "";
          };
          on-scroll-up = "hyprctl dispatch workspace e+1";
          on-scroll-down = "hyprctl dispatch workspace e-1";
        };
        "hyprland/window" = {
          format = "{title}";
          max-length = 40;
          icon = true;
          icon-size = 18;
          separate-outputs = true;
          rewrite = {
            "(.*)Nvim(.*)" = "Neovim ";
            "(.*)Mozilla Firefox(.*)" = "Firefox ";
            "(.*) - Discord(.*)" = "Discord ";
            "^(.+?)\\s* - \\s*(.+)$" = "Spotify ";
          };
        };
        "tray" = {
          spacing = 10;
        };
        "clock" = {
          format = " <span color='#bf616a'> </span>{:%I:%M %p} ";
          format-alt = " <span color='#bf616a'> </span>{:%a %b %d} ";
          tooltip-format = " <big>{:%B%Y}</big>\n<tt><small>{calendar}</small></tt> ";
        };

        "cpu" = {
          interval = 1;
          format = " 󰍛 {}% ";
          max-length = 10;
          on-click = "";
        };
        "memory" = {
          interval = 1;
          format = "  {used:0.1f}G ";
          format-alt = " 󰋊 {}% ";
          max-length = 10;
        };
        "network" = {
          format-wifi = " 󰖩 {essid} ";
          format-alt = " 󰖩 {signalStrength}% ";
          format-ethernet = " 󰈀 Wired ";
          format-disconnected = " 󰖪  ";
          on-click-right = "wifimenu";
        };

        pulseaudio = {
          format = " {icon} {volume}% ";
          format-bluetooth = "   {volume}% ";
          format-bluetooth-muted = "  󰂯";
          format-muted = " 󰝟  ";
          format-icons = {
            headphone = "  ";
            hands-free = " 󰋌 ";
            headset = " 󰓃 ";
            phone = "  ";
            portable = "  ";
            car = "   ";
            default = ["  " "  " "  "];
          };
          on-click = "pavucontrol";
        };

        "bluetooth" = {
          on-click = "~/.config/waybar/scripts/rofi-bluetooth &";
          format = "  {status} ";
        };
        "custom/music-bar" = {
          exec = music-bar;
          interval = 1;
          return-type = "json";
          format = "{}";
        };
        "custom/music" = {
          exec = "${lizzy}/bin/lizzy --mediaplayer spotify --autotoggle";
          format = "{icon} : {text}";
          return-type = "json";
          format-icons = {
            "Playing" = "<span color=\"#1DB954\"> </span>";
            "Paused" = "<span color=\"#FF1313\"> </span>";
          };
          max-length = 60;
          tooltip = false;
          escape = true;
          on-click = "playerctl play-pause -p spotify";
          on-double-click-right = "playerctl next -p spotify";
          on-scroll-down = "playerctl previous";
        };
        "custom/power-menu" = {
          format = " <span color='#6a92d7'>⏻ </span>";
          on-click = "${powermenu}";
        };
        "custom/launcher" = {
          format = " <span color='#6a92d7'> 󱄅 </span> ";
          on-click = "rofi -show drun";
        };
      };
    };
    style = ''
          * {
            font-family: JetBrainsMono Nerd Font;
            font-size: 17px;
          }
          window#waybar {
            background-color: rgba(26, 27, 38, 0.5);
            color: #ffffff;
            transition-property: background-color;
            transition-duration: 0.5s;
            border-top: 8px transparent;
            border-radius: 8px;
            transition-duration: 0.5s;
            margin: 16px 16px;
          }
          window#waybar.hidden {
            opacity: 0.2;
          }
          #workspaces button {
            padding: 0 5px;
            color: #7984A4;
            background-color: transparent;
            box-shadow: inset 0 -3px transparent;
            border: none;
            border-radius: 0;
          }
          #workspaces button.focused {
            color: #bf616a;
          }
          #workspaces button.active {
            color: #6a92d7;
          }
          #workspaces button.urgent {
            background-color: #eb4d4b;
          }
          #window {
            /* border-radius: 20px; */
            /* padding-left: 10px; */
            /* padding-right: 10px; */
            color: #64727d;
          }
          #clock,
          #cpu,
          #memory,
          #disk,
          #temperature,
          #network,
          #pulseaudio,
          #custom-media,
          #tray,
          #mode,
          #idle_inhibitor,
          #mpd,
          #bluetooth,
          #custom-hyprPicker,
          #custom-power-menu,
          #custom-music,
          #window,
          #workspaces {
            margin: 0 4px;
            border-radius: 7.8px;
            background-color: #1f2530;
          }
          #cpu {
            color: #fb958b;
            background-color: #1f2530;
          }
          #memory {
            color: #ebcb8b;
            background-color: #1f2530;
          }
          #custom-power-menu {
            border-radius: 9.5px;
            background-color: #1b242b;
            border-radius: 7.5px;
            padding: 0 5px;
          }
          #custom-launcher {
            background-color: #1b242b;
            color: #6a92d7;
            border-radius: 7.5px;
            padding: 0 3px;
          }
          .modules-left > widget:first-child > #workspaces {
            margin-left: 0;
          }

          /* If workspaces is the rightmost module, omit right margin */
          .modules-right > widget:last-child > #workspaces {
            margin-right: 0;
          }

          #pulseaudio {
            color: #7d9bba;
          }

          #clock {
            color: #c8d2e0;
            /* background-color: #14141e; */
          }


          @keyframes blink {
            to {
              background-color: rgba(30, 34, 42, 0.5);
              color: #abb2bf;
            }
          }

          label:focus {
            background-color: #000000;
          }

          #disk {
            background-color: #964b00;
          }

          #bluetooth {
            color: #707d9d;
          }

          #bluetooth.disconnected {
            color: #f53c3c;
          }

          #network {
            color: #b48ead;
          }

          #network.disconnected {
            color: #f53c3c;
          }

          #custom-media {
            background-color: #66cc99;
            color: #2a5c45;
            min-width: 100px;
          }
          #window {
            color: #ffffff;
          }
          #custom-media.custom-music {
            background-color: #66cc99;
          }

          #custom-media.custom-vlc {
            background-color: #ffa000;
          }

          #temperature {
            background-color: #f0932b;
          }

          #temperature.critical {
            background-color: #eb4d4b;
          }

          #tray > .passive {
            -gtk-icon-effect: dim;
          }

          #tray > .needs-attention {
            -gtk-icon-effect: highlight;
            background-color: #eb4d4b;
          }

          #idle_inhibitor {
            background-color: #2d3436;
          }

          #idle_inhibitor.activated {
            background-color: #ecf0f1;
            color: #2d3436;
          }

          #mpd {
            color: #2a5c45;
          }

          #mpd.disconnected {
            color: #f53c3c;
          }

          #mpd.stopped {
            color: #90b1b1;
          }

          #mpd.paused {
            color: #51a37a;
          }

          #language {
            background: #00b093;
            color: #740864;
            padding: 0 5px;
            margin: 0 5px;
            min-width: 16px;
          }

          #keyboard-state {
            background: #97e1ad;
            color: #000000;
            padding: 0 0px;
            margin: 0 5px;
            min-width: 16px;
          }

          #keyboard-state > label {
            padding: 0 5px;
          }

          #custom-music {
            padding: 0 10px;
            margin: 0 4px;
            /* background-color: #1db954; */
            color: #ffffff;
          }
          #keyboard-state > label.locked {
            background: rgba(0, 0, 0, 0.2);
          }
    '';
  };
}
