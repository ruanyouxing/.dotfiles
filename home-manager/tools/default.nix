{ pkgs, ... }:
{
  imports = [
    ./neovim.nix
    ./ranger.nix
    ./zathura.nix
    ./btop.nix
  ];
}
