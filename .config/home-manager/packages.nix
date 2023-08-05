{pkgs, ...}: {
  home.packages = with pkgs; [
    nix-prefetch-github
    cmus
    du-dust
    mpv
    ncdu
    octofetch
    pipes
    pscircle
    pywal
    ranger
    ttyper
    silver-searcher
    rsync
    unzip
    xtitle
  ];
  # programs.rofi = {
  #   enable = true;
  #   package = pkgs.rofi.override{plugins = [pkgs.rofi-emoji];};
  #   configPath = "~/.config/rofi/config.rasi";
  # };
  programs.git = {
    enable = true;
    delta.enable = true;
    userEmail = "ruanyouxing7@gmail.com";
    userName = "ruanyouxing";
  };
}
