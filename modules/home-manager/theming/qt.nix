{pkgs, ...}: {
  home.packages = with pkgs; [
    papirus-folders
    libsForQt5.qt5ct
  ];

  qt = {
    enable = true;
    platformTheme.name = "qtct";
    style.name = "kvantum";
  };
}
