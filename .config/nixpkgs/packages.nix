{config, pkgs,...}:
{
  home.stateVersion = "22.11";
  fonts.fontconfig.enable = true;
  home.packages = with pkgs; [
	nodejs feh ibus ibus-engines.bamboo jdk yarn gh
        noto-fonts-emoji
        zoxide starship exa htop lazygit stow git
        sxhkd rofi cava polybar zathura kitty neovim picom-jonaburg
       (nerdfonts.override {fonts = ["FiraCode" "Iosevka"];})
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
		colorscheme catppuccin_mocha
	'';
};
}
