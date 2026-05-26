{pkgs, ...}: {
  home.packages = with pkgs; [
    gh
    htop
    xcp
    dust
    duf
    ncdu
    nix-prefetch-github
    octofetch
    pipes
    rsync
    ttyper
    silver-searcher
    unzip
  ];
}
