{
  inputs,
  pkgs,
  ...
}: let
  naersk = pkgs.callPackage inputs.naersk {};
  src = pkgs.fetchFromGitHub {
    "owner" = "ruanyouxing";
    "repo" = "mocword";
    "rev" = "b11cd13076315909ee90e71bd4a34c9e10059dd2";
    "hash" = "sha256-68c2rOmojICXl8Dg+ISf30PucvZUgJXtFJTA1wSZEDc=";
  };
  mocword-data = pkgs.stdenv.mkDerivation {
    name = "mocword-data";
    src = pkgs.fetchurl {
      url = "https://github.com/high-moctane/mocword-data/releases/download/eng20200217/mocword.sqlite.gz";
      hash = "sha256-5tyCED6A7ujn96D+D7Yc7vKKG5ZpF798P7tCk3wqEEA=";
    };
    nativeBuildInputs = [pkgs.gzip];
    unpackPhase = ''
      mkdir $out
      gunzip -c -f $src > $out/mocword.sqlite
    '';
  };
  mocword = naersk.buildPackage {
    inherit src;
    pname = "mocword";
    nativeBuildInputs = [pkgs.makeWrapper];
    postInstall = ''
      wrapProgram $out/bin/mocword \
      --prefix MOCWORD_DATA : ${mocword-data}/mocword.sqlite
    '';
  };
in {
  home.packages = [
    mocword
  ];
}
