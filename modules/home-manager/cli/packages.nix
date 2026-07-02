{pkgs, ...}: {
  home.packages = with pkgs; [
    gh
    xcp
    dust
    duf
    ncdu
    nix-prefetch-github
    octofetch
    pipes
    rsync
    ttyper
    unzip
    p7zip-rar
  ];
}
