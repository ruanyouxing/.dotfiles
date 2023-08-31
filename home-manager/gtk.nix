{pkgs, ...}: let
  candy-icons = pkgs.callPackage ./builds/candy-icons.nix {};
in {
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
