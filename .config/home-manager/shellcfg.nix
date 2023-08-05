{pkgs, ...}: {
  programs.starship.enable = true;
  programs.zoxide.enable = true;
  programs.zsh = {
    enable = true;
    enableAutosuggestions = true;
    enableCompletion = true;
    syntaxHighlighting.enable = true;
    plugins = [
      {
        name = "zsh-autopair";
        src = pkgs.fetchFromGitHub {
          owner = "hlissner";
          repo = "zsh-autopair";
          rev = "396c38a7468458ba29011f2ad4112e4fd35f78e6";
          sha256 = "PXHxPxFeoYXYMOC29YQKDdMnqTO0toyA7eJTSCV6PGE=";
        };
      }
      {
        name = "k";
        src = pkgs.fetchFromGitHub {
          owner = "supercrabtree";
          repo = "k";
          rev = "e2bfbaf3b8ca92d6ffc4280211805ce4b8a8c19e";
          sha256 = "32rJjBzqS2e6w/L78KMNwQRg4E3sqqdAmb87XEhqbRQ=";
        };
      }
    ];
    initExtra = ''
      cd(){
          if (( $# == 0  ))
            then builtin cd && builtin cd $(find . -type d -print | fzf );
          else
            builtin cd $1
          fi
        }
      export LD_LIBRARY_PATH=""
    '';
  };
  programs.exa = {
    enable = true;
    enableAliases = true;
    icons = true;
    git = true;
  };
  home = {
    sessionVariables = {
      DOTFILES = "/home/hungz/.dotfiles";
      GTK_IM_MODULE = "ibus";
      XMODIFIERS = "ibus";
      QT_IM_MODULE = "ibus";
      WORKSPACE = "/windows/Users/hungz/my_workspace";
      WLR_NO_HARDWARE_CURSOR = "1";
    };
    sessionPath = [
      "$HOME/.local/bin"
    ];
    shellAliases = {
      lg = "lazygit";
      g = "git";
      record = "ffmpeg -video_size 1920x1080 -framerate 60 -f x11grab -i :0.0
      output.mkv";
      startx = "startx ~/.xinitrc > /dev/null 2>&1";
      v = "fd -H | fzf | xargs nvim";
    };
  };
}
