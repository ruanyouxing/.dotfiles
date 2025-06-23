{ pkgs, ... }:
let
  catpuccin-icons = pkgs.callPackage ./catppuccin-icons.nix { };
in
{
  home.pointerCursor = {
    gtk.enable = true;
    package = pkgs.catppuccin-cursors.macchiatoSapphire;
    name = "Catppuccin Macchiato Sapphire";
    size = 16;
  };
  gtk = {
    enable = true;
    theme = {
      name = "Catppuccin-GTK-Purple-Dark-Compact-Macchiato";
      package = pkgs.magnetic-catppuccin-gtk.override {
        accent = [ "purple" ];
        shade = "dark";
        size = "compact";
        tweaks = [ "macchiato" ];
      };
    };
    iconTheme = {
      package = catpuccin-icons;
      name = "Catppuccin-Frappe";
    };
    cursorTheme = {
      package = pkgs.catppuccin-cursors.macchiatoSapphire;
      name = "Catppuccin Macchiato Sapphire";
    };
  };
}
