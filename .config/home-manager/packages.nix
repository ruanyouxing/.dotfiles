{pkgs, ...}: {
  home.packages = with pkgs; [
    # Fonts
    (nerdfonts.override {fonts = ["JetBrainsMono" "Iosevka" "FiraCode"];})
    noto-fonts-cjk-serif
    noto-fonts-cjk-sans
    source-han-serif
    source-han-mono
    source-han-sans
    source-code-pro
    material-icons
    material-design-icons

    #Tools
    # betterlockscreen
    cava
    nix-prefetch-github
    chafa
    cmus
    fd
    feh
    flameshot
    fzf
    haskellPackages.greenclip
    ibus-engines.bamboo
    du-dust
    lazygit
    luajit
    mpv
    ncdu
    nodejs
    octofetch
    pipes
    # picom-jonaburg
    pscircle
    pywal
    ranger
    ripgrep
    ttyper
    rsync
    unzip
    xtitle
    xorg.lndir
    xorg.xsetroot
    yarn
  ];
  # programs.rofi = {
  #   enable = true;
  #   package = pkgs.rofi.override{plugins = [pkgs.rofi-emoji];};
  #   configPath = "~/.config/rofi/config.rasi";
  # };
  programs.git = {
    enable = true;
    delta.enable = true;
    userEmail = "ruanyouxing7@gmail.com";
    userName = "ruanyouxing";
  };
}
