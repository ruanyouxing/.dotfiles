{
  pkgs,
  lib,
  ...
}: {
  home.packages = with pkgs; [
    (nerdfonts.override {fonts = ["JetBrainsMono" "Iosevka" "FiraCode"];})
    noto-fonts-cjk-serif
    noto-fonts-cjk-sans
    source-han-serif
    source-han-mono
    source-han-sans
    source-code-pro
    material-icons
    material-design-icons
    gcc
    fd
    fzf
    ripgrep
    lazygit
    luajit
    nodejs
    yarn
    python311Packages.pip
    haskellPackages.greenclip
  ];
  programs.neovim = {
    enable = true;
    defaultEditor = true;
    package = pkgs.symlinkJoin {
      name = "neovim";
      paths = [pkgs.neovim-unwrapped];
      buildInputs = [pkgs.makeWrapper];
      postBuild = let
        path = with pkgs;
          [
            nodePackages.prettier
            clang-tools
            lldb_9
            python310Packages.debugpy
            black
            stylua
            shellcheck
            alejandra
          ]
          ++ lib.optionals (!stdenv.isDarwin) [
            xclip
          ];
      in ''
        wrapProgram $out/bin/nvim\
          --prefix PATH : ${lib.makeBinPath path} \
          --set LD_LIBRARY_PATH ${pkgs.stdenv.cc.cc.lib}/lib
      '';
    };
  };
}
