{pkgs, ...}: let
  candy-icons = pkgs.callPackage ./builds/candy-icons.nix {};
  sweet-cursors = pkgs.callPackage ./builds/sweet-cursors.nix {};
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
      package = sweet-cursors;
      name = "Sweet-cursors";
    };
  };
}
