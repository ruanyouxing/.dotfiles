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
