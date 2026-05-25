{
  lib,
  pkgs,
  config,
  extraPkgs,
  catppuccinFlavor,
  catppuccinAccent,
  ...
}: let
  homeDir = config.home.homeDirectory;
  toSentence = lib.toSentenceCase;
  cursorPkgName = "${catppuccinFlavor}${toSentence catppuccinAccent}";
in {
  home.pointerCursor = {
    gtk.enable = true;
    x11.enable = true;
    hyprcursor = {
      enable = true;
      size = 24;
    };
    package = pkgs.catppuccin-cursors.${cursorPkgName};
    name = "Catppuccin ${toSentence catppuccinFlavor} ${toSentence catppuccinAccent}";
    size = 16;
  };
  gtk = {
    enable = true;
    font = {
      name = "Iosevka Nerd Font";
      size = 14;
    };
    theme = {
      name = let
        flavorSuffix = lib.optionalString (catppuccinFlavor != "mocha") "-${toSentence catppuccinFlavor}";
      in "Catppuccin-GTK-${toSentence catppuccinAccent}-Dark-Compact${flavorSuffix}";
      package = pkgs.magnetic-catppuccin-gtk.override {
        accent = [catppuccinAccent];
        shade = "dark";
        size = "compact";
        tweaks = lib.lists.remove "mocha" [catppuccinFlavor];
      };
    };
    iconTheme = {
      package = lib.mkForce extraPkgs.catppuccin-icons;
      name = lib.mkForce "Catppuccin-${toSentence catppuccinFlavor}";
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
