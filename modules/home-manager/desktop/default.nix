{
  pkgs,
  ...
}: let
in {
  home.packages = with pkgs; [
    slurp
    grim
    mpvpaper
    awww
    wtype
    wl-clipboard
    dunst
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
  xdg.configFile."hypr" = {
    source = ./hyprland;
    recursive = true;
  };
  wayland.windowManager.hyprland = {
    enable = true;
    configType = "lua";
    # plugins = [];
  };
}
