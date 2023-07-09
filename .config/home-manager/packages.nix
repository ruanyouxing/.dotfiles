{ pkgs, ... }:
{
  home.packages = with pkgs; [
    # Fonts
    (nerdfonts.override { fonts = [ "JetBrainsMono" "Iosevka" "FiraCode" ]; })
    noto-fonts-cjk-serif
    noto-fonts-cjk-sans
    source-han-serif
    source-han-mono
    source-han-sans
    source-code-pro
    material-icons
    material-design-icons


    #LSP and formatters
    nodePackages.prettier
    # nil
    # nodePackages.eslint
    # lua-language-server
    # nodePackages.bash-language-server
    # nodePackages.vscode-html-languageserver-bin
    # nodePackages.vscode-css-languageserver-bin
    # nodePackages.vscode-json-languageserver-bin
    # nodePackages.pyright
    # nodePackages.typescript-language-server
    clang-tools
    lldb_9
    python310Packages.debugpy
    black
    stylua
    shellcheck
    nixpkgs-fmt

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
    mpd
    mpv
    nodejs
    ncmpcpp
    ocs-url
    octofetch
    pipes
    # picom-jonaburg
    # polybar
    pscircle
    pywal
    ranger
    ripgrep
    # rofi
    # rofi-emoji
    # rofimoji
    rsync
    unzip
    xtitle
    xorg.xsetroot
    yarn
  ];
}
