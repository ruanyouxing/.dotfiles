source ~/.zplug/init.zsh 

zplug "zsh-users/zsh-syntax-highlighting"
zplug "zsh-users/zsh-completions"
zplug "zsh-users/zsh-autosuggestions"
zplug "hlissner/zsh-autopair"
zplug "spwhitt/nix-zsh-completions"
zplug load


eval "$(zoxide init zsh)"
eval "$(starship init zsh)"
alias ls='exa --icons'
alias lg='lazygit'


export PATH="$HOME/.local/bin:$PATH"
export DOTFILES="${HOME}/.dotfiles"
if [ -e /home/hungz/.nix-profile/etc/profile.d/nix.sh ]; then . /home/hungz/.nix-profile/etc/profile.d/nix.sh; fi # added by Nix installer
