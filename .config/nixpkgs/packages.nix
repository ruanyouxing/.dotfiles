{config, pkgs,lib,...}:
{
  home.stateVersion = "22.11";
  fonts.fontconfig.enable = true;
  home.packages = with pkgs; [
    nodejs feh gh gcc
        noto-fonts-emoji
        zoxide starship exa htop lazygit stow git
        sxhkd rofi cava polybar zathura picom-jonaburg
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
		colorscheme catppuccin_mocha
	'';
      };
     programs.neovim = {
       enable = false;
       viAlias = true;
       withPython3 = true;
       plugins = with pkgs.vimPlugins; [
         nvim-treesitter.withAllGrammars
       ];
  };
}
