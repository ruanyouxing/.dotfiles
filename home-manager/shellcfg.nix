{pkgs, ...}: {
  programs.starship.enable = true;
  programs.zoxide.enable = true;
  programs.zsh = {
    enable = true;
    enableAutosuggestions = true;
    enableCompletion = true;
    initExtraFirst = ''
      source ${pkgs.zinit}/share/zinit/zinit.zsh
      zinit load hlissner/zsh-autopair
      zinit wait lucid for \
      atinit"ZINIT[COMPINIT_OPTS]=-C; zicompinit; zicdreplay" \
        zdharma-continuum/fast-syntax-highlighting \
      blockf \
        zsh-users/zsh-completions \
      atload"!_zsh_autosuggest_start" \
        zsh-users/zsh-autosuggestions
      zinit ice as"command" from"gh-r" \
      atpull"%atclone" src"init.zsh"
    '';
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
