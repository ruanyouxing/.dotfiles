source ~/.zplug/init.zsh 

zplug "zsh-users/zsh-syntax-highlighting"
zplug "zsh-users/zsh-completions"
zplug "zsh-users/zsh-autosuggestions"
zplug "hlissner/zsh-autopair"
zplug "spwhitt/nix-zsh-completions"
zplug load

eval "$(zoxide init zsh)"
eval "$(starship init zsh)"
cd()
{
    if (( $# == 0  ))
      then builtin cd && builtin cd $(find . -type d -print | fzf );
    else 
      builtin cd $1
    fi
}
alias ls='exa --icons'
alias lg='lazygit'
alias record='ffmpeg -video_size 1920x1080 -framerate 60 -f x11grab -i :0.0 output.mkv'
alias startx='startx ~/.xinitrc > /dev/null 2>&1'
alias v='fd -H | fzf | xargs nvim'
if [ -e /home/hungz/.nix-profile/etc/profile.d/nix.sh ]; then . /home/hungz/.nix-profile/etc/profile.d/nix.sh; fi # added by Nix installer
