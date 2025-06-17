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
  output-toggle = pkgs.callPackage ./scripts/output-toggle.nix {};
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
          on-click-right = (toString ../../scripts/wifimenu);
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
          on-scroll-up = output-toggle;
          on-scroll-down = output-toggle;
          on-click = "pavucontrol";
        };

        "bluetooth" = {
          on-click = "~/.config/waybar/scripts/rofi-bluetooth &";
          format = "  {status} ";
        };
        "custom/music-bar" = {
          exec = music-bar.progress-bar;
          interval = 1;
          return-type = "json";
          format = "{}";
          on-click = music-bar.toggle-bar;
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
    style = builtins.readFile ./waybar.css;
  };
}
