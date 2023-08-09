{pkgs, ...}: {
  home.packages = with pkgs; [
    nix-prefetch-github
    cmus
    discord
    du-dust
    duf
    mpv
    ncdu
    octofetch
    opera
    obs-studio
    pavucontrol
    pipes
    pscircle
    pywal
    ranger
    spotify
    ttyper
    silver-searcher
    python311Packages.requests
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
