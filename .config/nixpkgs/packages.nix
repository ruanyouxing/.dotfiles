{ config, pkgs, lib, ... }:
{
  home.stateVersion = "22.11";
  fonts.fontconfig.enable = true;
  home.packages = with pkgs; [
    feh
    gh
    gcc
    noto-fonts-emoji
    stow
    git
    nixpkgs-fmt
    #      (nerdfonts.override {fonts = ["FiraCode" "Iosevka"];})
  ];
  programs.home-manager = {
    enable = true;
  };
  programs.git = {
    enable = true;
    userName = "ruanyouxing";
    userEmail = "ruanyouxing7@gmail.com";
  };
  programs.vim = {
    enable = true;
    plugins = with pkgs.vimPlugins; [
      vim-nix
      catppuccin-vim
      auto-pairs
    ];
    extraConfig = ''
      		set mouse=a
      	'';
  };
  programs.neovim = {
    # enable = true;
    plugins = with pkgs.vimPlugins; [
      nvim-treesitter.withAllGrammars
    ];
  };
}
