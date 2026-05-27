{pkgs, ...}: {
  programs.rofi = {
    enable = true;
    package = pkgs.rofi.override {plugins = [pkgs.rofi-emoji];};
    font = "JetBrainsMono Nerd Font Medium 11";
    extraConfig = {
      modi = "window,run,drun,emoji";
      show-icons = true;
      display-drun = "Applications: ";
      display-run = "Execute: ";
      display-window = "Windows: ";
    };
  };
}
