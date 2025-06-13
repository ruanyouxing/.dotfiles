{pkgs, ...}: let
  candy-icons = pkgs.callPackage ./builds/candy-icons.nix {};
in {
  home.pointerCursor = {
    gtk.enable = true;
    package = pkgs.sweet-nova;
    name = "Sweet-cursors";
    size = 16;
  };
  gtk = {
    enable = true;
    theme = {
      package = pkgs.sweet;
      name = "Sweet-Dark";
    };
    iconTheme = {
      package = candy-icons;
      name = "candy-icons";
    };
    cursorTheme = {
      package = pkgs.sweet-nova;
      name = "Sweet-cursors";
    };
  };
}
