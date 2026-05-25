{
  pkgs,
  config,
  extraPkgs,
  ...
}: let
  homeDir = config.home.homeDirectory;
in {
  home.pointerCursor = {
    gtk.enable = true;
    dotIcons.enable = true;
    x11.enable = true;
    hyprcursor = {
      enable = true;
      size = 24;
    };
    package = pkgs.catppuccin-cursors.macchiatoMauve;
    name = "Catppuccin Macchiato Mauve";
    size = 16;
  };
  gtk = {
    enable = true;
    font = {
      name = "Iosevka Nerd Font";
      size = 14;
    };
    theme = {
      name = "Catppuccin-GTK-Mauve-Dark-Compact-Macchiato";
      package = pkgs.magnetic-catppuccin-gtk.override {
        accent = ["mauve"];
        shade = "dark";
        size = "compact";
        tweaks = ["macchiato"];
      };
    };
    iconTheme = {
      package = extraPkgs.catppuccin-icons;
      name = "Catppuccin-Macchiato";
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
