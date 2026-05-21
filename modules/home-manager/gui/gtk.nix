{
  pkgs,
  config,
  ...
}:
let
  catpuccin-icons = pkgs.callPackage ./catppuccin-icons.nix { };
  homeDir = config.home.homeDirectory;
in
{
  home.pointerCursor = {
    gtk.enable = true;
    dotIcons.enable = true;
    x11.enable = true;
    hyprcursor = {
      enable = true;
      size = 24;
    };
    package = pkgs.catppuccin-cursors.macchiatoSapphire;
    name = "Catppuccin Macchiato Sapphire";
    size = 16;
  };
  gtk = {
    enable = true;
    font = {
      name = "Iosevka Nerd Font";
      size = 14;
    };
    theme = {
      name = "Catppuccin-GTK-Purple-Dark-Compact-Macchiato";
      package = pkgs.magnetic-catppuccin-gtk.override {
        accent = [ "lavender" ];
        shade = "dark";
        size = "compact";
        tweaks = [ "macchiato" ];
      };
    };
    iconTheme = {
      package = catpuccin-icons;
      name = "Catppuccin-Frappe";
    };
    gtk3 = {
      bookmarks = [
        "file://${homeDir}/Downloads"
        "file://${homeDir}/Pictures"
        "file://${homeDir}/Videos"
        "file://${homeDir}/.dotfiles"
        "file:///windows"
        "file:///data"
        "file:///extras"
      ];
    };
  };
}
