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
    rev = "0a1ee8271ed1619daddc109317d6328c390152ef";
    hash = "sha256-d1bo4otcQzVqYw+rtk1FxVcQ0+eEKhYYk5oT39EBWgk=";
  };
  dontFixup = true;
  installPhase = ''
    mkdir -p $out
    cp -R $src/* $out
  '';
}
