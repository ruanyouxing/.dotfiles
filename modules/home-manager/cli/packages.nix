{pkgs, ...}: {
  home.packages = with pkgs; [
    pywal
    gh
    htop
    xcp
    dust
    duf
    ncdu
    nix-prefetch-github
    octofetch
    pipes
    ranger
    rsync
    ttyper
    silver-searcher
    unzip
  ];
}
