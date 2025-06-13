{
  pkgs,
  ...
}: {
  home.packages = with pkgs; [
    fira-code
    nerd-fonts.jetbrains-mono
    nerd-fonts.iosevka
    noto-fonts-cjk-serif
    noto-fonts-cjk-sans
    source-han-serif
    source-han-mono
    source-han-sans
    source-code-pro
    material-icons
    material-design-icons
    gcc
    gnumake
    fd
    fzf
    ripgrep
    lazygit
    luajit
    nodejs
    yarn
    python311Packages.pip
    haskellPackages.greenclip
    eslint_d
    nodePackages.prettier
    pkgs.clang-tools
    pkgs.lldb pkgs.python310Packages.debugpy pkgs.black
    pkgs.stylua
    pkgs.shellcheck
    pkgs.alejandra
  ];
  programs.neovim = {
    enable = true;
    defaultEditor = true;
    package = pkgs.neovim-unwrapped;
  };
}
