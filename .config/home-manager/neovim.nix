{
  pkgs,
  lib,
  ...
}: {
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
            tree-sitter
            nodePackages.prettier
            nil
            nodePackages.eslint
            efm-langserver
            lua-language-server
            rust-analyzer
            nodePackages.bash-language-server
            nodePackages.vscode-html-languageserver-bin
            nodePackages.vscode-css-languageserver-bin
            nodePackages.vscode-json-languageserver-bin
            nodePackages.pyright
            nodePackages.typescript-language-server
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
