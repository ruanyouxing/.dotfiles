{ config, pkgs, ... }:
{
  home.packages = with pkgs; [
    betterlockscreen
    bspwm
    cava
    chafa
    cmus
    exa
    fd
    feh
    flameshot
    fzf
    haskellPackages.greenclip
    # ibus-engines.bamboo
    # kitty
    lazygit
    luajit
    material-design-icons
    mpd
    mpv
    ncmpcpp
    nixpkgs-fmt
    ocs-url
    octofetch
    picom-jonaburg
    pipes
    polybar
    pscircle
    pywal
    ranger
    ripgrep
    # rofi
    # rofi-emoji
    # rofimoji
    rsync
    sxhkd
    xtitle
    yarn
    zathura
  ];
}
