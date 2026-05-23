{pkgs, ...}: {
  imports = [
    ./quickshell
    ./gtk.nix
    ./browser.nix
    ./spotify.nix
    ./flameshot.nix
    ./qt.nix
    ./obs.nix
    # ./mpv.nix
    ./rofi
    ./kitty
  ];
  home.packages = with pkgs; [
    (discord.override {withVencord = true;})
    thunar
    feh
    qbittorrent-enhanced
    peazip
    handbrake
    ristretto
    gparted
    qownnotes
    kdePackages.okular
    # xournalpp
  ];
}
