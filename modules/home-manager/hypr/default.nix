{ pkgs, ... }:
{
  imports = [
    ./waybar.nix
    ./wlogout.nix
    ./hyprland.nix
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
    (rofi-wayland.override { plugins = [ pkgs.rofi-emoji-wayland ]; })
  ];
  services.gammastep = {
    enable = true;
    provider = "manual";
    latitude = 12.0;
    longitude = 107.0;
  };
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
}
