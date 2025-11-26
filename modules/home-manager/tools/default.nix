{
  pkgs,
  inputs,
  ...
}:
let
  mocword = pkgs.callPackage ./mocword.nix { naersk = pkgs.callPackage inputs.naersk { }; };
in
{
  imports = [
    ./neovim.nix
    ./ranger.nix
    ./zathura.nix
    ./btop.nix
    ./yazi.nix
  ];
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
