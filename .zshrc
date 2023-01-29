source ~/.zplug/init.zsh 

zplug "zsh-users/zsh-syntax-highlighting"
zplug "zsh-users/zsh-completions"
zplug "zsh-users/zsh-autosuggestions"
zplug "hlissner/zsh-autopair"
zplug "spwhitt/nix-zsh-completions"
zplug load

eval "$(zoxide init zsh)"
eval "$(starship init zsh)"
alias cd="cd && cd \$(find . -type d -print | fzf)"
alias ls='exa --icons'
alias lg='lazygit'
alias startx='startx ~/.xinitrc > /dev/null 2>&1'
alias v='fd -H | fzf | xargs nvim'
if [ -e /home/hungz/.nix-profile/etc/profile.d/nix.sh ]; then . /home/hungz/.nix-profile/etc/profile.d/nix.sh; fi # added by Nix installer
