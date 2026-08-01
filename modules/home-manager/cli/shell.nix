{
  pkgs,
  config,
  homeDir,
  ...
}: {
  programs = {
    starship = {
      enable = true;
      enableNushellIntegration = true;
      settings = {
        nix_shell = {
          symbol = "󱄅 ";
          heuristic = true;
        };
      };
    };
    zoxide = {
      enable = true;
      enableNushellIntegration = true;
    };
    direnv = {
      enable = true;
      nix-direnv.enable = true;
      enableNushellIntegration = true;
    };
    nushell = {
      enable = true;
      # shellAliases = {
      #   lg = "${pkgs.lazygit}/bin/lazygit";
      #   g = "git";
      #   nixcheck = "nix flake check";
      #   nixupdate = "nix flake update";
      #   # record = "${pkgs.ffmpeg_6}/bin/ffmpeg -video_size 1920x1080 -framerate 60 -f x11grab -i :0.0 output.mkv";
      #   startx = "startx ~/.xinitrc > /dev/null out+err>";
      #   v = "${pkgs.fd}/bin/fd -H | ${pkgs.fzf}/bin/fzf | ${pkgs.findutils}/bin/xargs nvim";
      #   nixos-switch = "nh os switch --ask ${homeDir}/.dotfiles";
      #   nixos-test = "nh os test --ask ${homeDir}/.dotfiles";
      #   nixos-boot = "nh os boot --ask ${homeDir}/.dotfiles";
      #   nixos-cleanall = "nh clean all --ask";
      #   nixos-search = "nh search";
      #   nix-shell = "nix-shell --command nu";
      #   cp = "xcp";
      # };
      configFile.text = ''
          def --env _custom_cd [
            path?: string
        ] {
            if ($path == null) {
                let dirs = (ls -a **/* | where type == dir | get name)

                let choice = ($dirs | input list --fuzzy "Select directory to jump to:")

                if not ($choice | is-empty) {
                    cd $choice
                } else {
                    cd ~
                }
            } else {
                cd $path
            }
        }

        alias cd = _custom_cd
      '';
      settings = {
        show_banner = false;
      };
    };
  };
}
