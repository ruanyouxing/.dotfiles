{ config, ... }: {
  home = {
    username = "hungz";
    homeDirectory = "/home/hungz";
    stateVersion = "23.05";
    sessionVariables = {
      DOTFILES = "${config.home.homeDirectory}/.dotfiles";
      GTK_IM_MODULE = "ibus";
      XMODIFIERS = "ibus";
      QT_IM_MODULE = "ibus";
    };
    sessionPath = [
      "$HOME/.local/bin"
      "$HOME/.config/bspwm/scripts"
    ];
    shellAliases = {
      ls = "exa --icons";
      lg = "lazygit";
      record = "ffmpeg -video_size 1920x1080 -framerate 60 -f x11grab -i :0.0
      output.mkv";
      startx = "startx ~/.xinitrc > /dev/null 2>&1";
      v = "fd -H | fzf | xargs nvim";
    };
  };
  programs = {
    home-manager.enable = true;
    neovim = {
      enable = true;
      defaultEditor = true;
    };
    starship.enable = true;
    zoxide.enable = true;
    zsh = {
      enable = true;
      zplug = {
        enable = true;
        plugins = [
          { name = "zsh-users/zsh-syntax-highlighting"; }
          { name = "zsh-users/zsh-autosuggestions"; }
          { name = "zsh-users/zsh-completions"; }
          { name = "hlissner/zsh-autopair"; }
          { name = "spwhitt/nix-zsh-completions"; }
        ];
      };
      initExtra = ''
        cd()
        {
            if (( $# == 0  ))
              then builtin cd && builtin cd $(find . -type d -print | fzf );
            else 
              builtin cd $1
            fi
        }
      '';
    };
    git = {
      enable = true;
      delta.enable = true;
      userEmail = "ruanyouxing7@gmail.com";
      userName = "ruanyouxing";
    };
  };
}
