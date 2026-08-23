{
  pkgs,
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
      settings = {
          edit_mode = "vi";
        };
      shellAliases = {
        lg = "${pkgs.lazygit}/bin/lazygit";
        g = "git";
        nixcheck = "nix flake check";
        nixupdate = "nix flake update";
        #   # record = "${pkgs.ffmpeg_6}/bin/ffmpeg -video_size 1920x1080 -framerate 60 -f x11grab -i :0.0 output.mkv";
        #   startx = "startx ~/.xinitrc > /dev/null out+err>";
        #   v = "${pkgs.fd}/bin/fd -H | ${pkgs.fzf}/bin/fzf | ${pkgs.findutils}/bin/xargs nvim";
        nixos-cleanall = "nh clean all --ask";
        nixos-search = "nh search";
        nix-shell = "nix-shell --command nu";
        cp = "xcp";
      };
      settings = {
        show_banner = false;
      };
    };
  };
}
