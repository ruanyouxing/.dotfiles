{
  pkgs,
  config,
  homeDir,
  ...
}: {
  programs.starship = {
    enable = true;
    settings = {
      nix_shell = {
        symbol = "󱄅 ";
        heuristic = true;
      };
    };
  };
  programs.zoxide.enable = true;
  programs.direnv = {
    enable = true;
    nix-direnv.enable = true;
    enableZshIntegration = true;
  };
  programs.zsh = {
    enable = true;
    autosuggestion.enable = true;
    enableCompletion = true;
    plugins = [
      {
        name = "zsh-autopair";
        src = pkgs.zsh-autopair;
        file = "share/zsh/zsh-autopair/autopair.zsh";
      }
      {
        name = "you-should-use";
        src = pkgs.zsh-you-should-use;
        file = "share/zsh/plugins/you-should-use/you-should-use.plugin.zsh";
      }
      {
        name = "fast-syntax-highlighting";
        src = pkgs.zsh-fast-syntax-highlighting;
        file = "share/zsh/plugins/fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh";
      }
      {
        name = "zsh-history-substring-search";
        src = pkgs.zsh-history-substring-search;
        file = "share/zsh/plugins/zsh-history-substring-search/zsh-history-substring-search.plugin.zsh";
      }
    ];
    initContent = ''
      fpath+=(${pkgs.zsh-completions}/share/zsh/site-functions)

      bindkey '^[[A' history-substring-search-up
      bindkey '^[[B' history-substring-search-down

      cd(){
          if (( $# == 0  ))
            then builtin cd && builtin cd $(${pkgs.findutils}/bin/find . -type d -print | ${pkgs.fzf}/bin/fzf );
          else
            builtin cd $1
          fi
        }
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
      DOTFILES = "/${homeDir}/.dotfiles";
      # GTK_IM_MODULE = "fcitx5";
      XDG_CONFIG_HOME = "${config.xdg.configHome}";
      EDITOR = "nvim";
    };
    sessionPath = [
      "${homeDir}/.local/bin"
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
      nixos-switch = "nh os switch --ask ${homeDir}/.dotfiles";
      nixos-test = "nh os test --ask ${homeDir}/.dotfiles";
      nixos-boot = "nh os boot --ask ${homeDir}/.dotfiles";
      nixos-cleanall = "nh clean all --ask";
      nixos-search = "nh search";
      nix-shell = "nix-shell --command zsh";
      cp = "xcp";
    };
  };
}
