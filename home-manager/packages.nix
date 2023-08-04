{pkgs, ...}: {
  home.packages = with pkgs; [
    nix-prefetch-github
    cmus
    discord
    ibus-engines.bamboo
    du-dust
    duf
    mpv
    ncdu
    octofetch
    opera
    pavucontrol
    pipes
    pscircle
    pywal
    ranger
    spotify
    ttyper
    silver-searcher
    rsync
    unzip
    google-chrome
  ];
  programs.git = {
    enable = true;
    delta.enable = true;
    userEmail = "ruanyouxing7@gmail.com";
    userName = "ruanyouxing";
  };
}
