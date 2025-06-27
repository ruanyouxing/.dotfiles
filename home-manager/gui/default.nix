{ pkgs, ... }:
{
  imports = [
    ./quickshell
    ./gtk.nix
    ./browser.nix
    ./spotify.nix
    ./flameshot.nix
    ./qt.nix
    ./obs.nix
    ./mpv.nix
  ];
  home.packages = with pkgs; [
    (discord.override { withVencord = true; })
    xfce.thunar
    feh
    kitty
    qbittorrent-enhanced
    peazip
    handbrake
    xfce.ristretto
    vscode
  ];
}
