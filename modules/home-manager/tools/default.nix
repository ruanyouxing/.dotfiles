{
  pkgs,
  customLib,
  ...
}: {
  imports = customLib.importModules {
    dir = ./.;
  };
  home.packages = with pkgs; [
    pywal
    gh
    htop
    xcp
    zinit
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
