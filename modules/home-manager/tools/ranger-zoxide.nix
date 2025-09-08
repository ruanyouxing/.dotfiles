{
  stdenv,
  fetchFromGitHub,
}:
stdenv.mkDerivation {
  name = "ranger-zoxide";
  src = fetchFromGitHub {
    owner = "jchook";
    repo = "ranger-zoxide";
    rev = "aefff2797b8e3999f659176dc99d76f7186ccc29";
    hash = "sha256-lF0p2cXXutLapYU3vox/OdZSoRHfq+WUnXdxDzd6tx0=";
  };
  installPhase = ''
  mkdir -p $out/ranger-zoxide
  cp -r ./__init__.py $out/ranger-zoxide
  '';
}
