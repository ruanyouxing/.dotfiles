{
  stdenv,
  fetchFromGitHub,
  ...
}:
stdenv.mkDerivation {
  name = "zinit";
  src = fetchFromGitHub {
    owner = "zdharma-continuum";
    repo = "zinit";
    rev = "2daaac2de245a640ca8a88330313e5f37113563e";
    hash = "sha256-ycHI98KysBX2+nHxyC9PyZQBGYmBhvJ/slSd0gY1iTg=";
  };
  dontFixup = true;
  installPhase = ''
    mkdir -p $out
    cp -R $src/* $out
  '';
}
