{
  inputs,
  pkgs,
  ...
}:
let
  nvim-config = inputs.nvim-config;
in
{
  home.packages = with pkgs; [
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
    clang-tools
    ccls
    lldb
    python310Packages.debugpy
    black
    stylua
    shellcheck
    alejandra
  ];
  programs.neovim = {
    enable = true;
    defaultEditor = true;
    package = pkgs.neovim-unwrapped;
  };
  xdg.configFile."nvim".source = nvim-config;
}
