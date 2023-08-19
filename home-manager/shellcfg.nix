{pkgs, ...}: {
  programs.starship.enable = true;
  programs.zoxide.enable = true;
  programs.zsh = {
    enable = true;
    enableAutosuggestions = true;
    enableCompletion = true;
    plugins = [
      {
        name = "fast-syntax-highlighting";
        src = pkgs.fetchFromGitHub {
          owner = "zdharma-continuum";
          repo = "fast-syntax-highlighting";
          rev = "cf318e06a9b7c9f2219d78f41b46fa6e06011fd9";
          hash = "sha256-RVX9ZSzjBW3LpFs2W86lKI6vtcvDWP6EPxzeTcRZua4=";
        };
      }

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
      WLR_NO_HARDWARE_CURSORS = "1";
      QT_IM_MODULE = "ibus";
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
      hm-switch = "home-manager switch --flake '/home/hungz/.dotfiles#hungz'";
      nixos-switch = "sudo nixos-rebuild switch --flake '/home/hungz/.dotfiles#nixos'";
    };
  };
}
