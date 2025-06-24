{
  pkgs,
  config,
  ...
}:
{
  home.packages = with pkgs; [
    zinit
    du-dust
    duf
    ncdu
    nix-prefetch-github
    octofetch
    pipes
    ranger
    rsync
    ttyper
    silver-searcher
    unzip
  ];
  programs.starship.enable = true;
  programs.zoxide.enable = true;
  programs.zsh = {
    enable = true;
    autosuggestion.enable = true;
    enableCompletion = true;
    initContent = ''
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

          cd(){
              if (( $# == 0  ))
                then builtin cd && builtin cd $(${pkgs.findutils}/bin/find . -type d -print | ${pkgs.fzf}/bin/fzf );
              else
                builtin cd $1
              fi
            }

      if uwsm check may-start; then
        exec uwsm start hyprland-uwsm.desktop
      fi
    '';
  };
  programs.eza = {
    enable = true;
    enableZshIntegration = true;
    icons = "auto";
    git = true;
  };
  home = {
    sessionVariables = {
      DOTFILES = "/home/hungz/.dotfiles";
      # GTK_IM_MODULE = "fcitx5";
      XDG_CONFIG_HOME = "${config.xdg.configHome}";
    };
    sessionPath = [
      "$HOME/.local/bin"
      "$HOME/.dotfiles/scripts"
    ];
    shellAliases = {
      lg = "${pkgs.lazygit}/bin/lazygit";
      g = "git";
      nixcheck = "nix flake check";
      nixupdate = "nix flake update";
      record = "${pkgs.ffmpeg_6}/bin/ffmpeg -video_size 1920x1080 -framerate 60 -f x11grab -i :0.0
      output.mkv";
      startx = "startx ~/.xinitrc > /dev/null 2>&1";
      v = "${pkgs.fd}/bin/fd -H | ${pkgs.fzf}/bin/fzf | ${pkgs.findutils}/bin/xargs nvim";
      # hm-switch = "home-manager switch --flake '/home/hungz/.dotfiles#hungz'";
      nixos-switch = "nh os switch --ask /home/hungz/.dotfiles";
      nixos-test = "nh os test --ask /home/hungz/.dotfiles";
      nixos-boot = "nh os boot --ask /home/hungz/.dotfiles";
      nixos-cleanall = "nh clean all --ask";
      nixos-search = "nh search";
      nix-shell = "nix-shell --command zsh";
      cp = "xcp";
    };
  };
}
