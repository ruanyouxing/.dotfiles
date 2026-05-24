{
  pkgs,
  inputs,
  customLib,
  ...
}: let
  mocword = pkgs.callPackage ./mocword.nix {naersk = pkgs.callPackage inputs.naersk {};};
in {
  imports = customLib.importModules {
    dir = ./.;
    excludeNames = ["mocword.nix"];
  };
  home.packages = with pkgs; [
    mocword
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
