source /usr/local/opt/zinit/zinit.zsh  
zinit load hlissner/zsh-autopair
  zinit wait lucid for \
 atinit"ZINIT[COMPINIT_OPTS]=-C; zicompinit; zicdreplay" \
    zdharma-continuum/fast-syntax-highlighting \
 blockf \
    zsh-users/zsh-completions \
 atload"!_zsh_autosuggest_start" \
    zsh-users/zsh-autosuggestions
zinit ice as"command" from"gh-r" \
          atclone"./starship init zsh > init.zsh; ./starship completions zsh > _starship" \
          atpull"%atclone" src"init.zsh"
zinit light starship/starship
eval "$(zoxide init zsh)"
alias lg="lazygit"
alias ls="exa --icons --git"
alias g="git"
alias record="ffmpeg -video_size 1920x1080 -framerate 60 -f x11grab -i :0.0 output.mkv"
alias startx="startx ~/.xinitrc > /dev/null 2>&1"
alias v="fd -H | fzf | xargs nvim"
export PATH="$PATH:${HOME}/.local/bin"
cd(){
  if (( $# == 0  ))
  then builtin cd && builtin cd $(find . -type d -print | fzf );
  else
    builtin cd $1
  fi
}
export WINDIR="/Users/$USER/.mounty"
export KITTY_CONFIG_DIRECTORY="/Users/$USER/.config/kitty"
