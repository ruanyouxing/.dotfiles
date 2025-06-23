{ pkgs, ... }:
let
  variant = "macchiato";
  accent = "blue";
  catppuccin-kvantum = pkgs.catppuccin-kvantum.override {
    inherit accent variant;
  };
in
{
  home.packages = with pkgs; [
    papirus-folders
    libsForQt5.qt5ct
  ];

  qt = {
    enable = true;
    platformTheme.name = "qtct";
    style.name = "kvantum";
  };

  xdg.configFile = {
    "Kvantum/kvantum.kvconfig".text = ''
      [General]
      theme=catppuccin-${variant}-${accent}
    '';

    "Kvantum/catppuccin-${variant}-${accent}".source =
      "${catppuccin-kvantum}/share/Kvantum/catppuccin-${variant}-${accent}";
  };
}
