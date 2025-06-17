{
  stdenv,
  fetchFromGitHub,
  ...
}:
stdenv.mkDerivation {
  name = "ranger-devicons";
  src = fetchFromGitHub {
    "owner" = "alexanderjeurissen";
    "repo" = "ranger_devicons";
    "rev" = "1bcaff0366a9d345313dc5af14002cfdcddabb82";
    "hash" = "sha256-qvWqKVS4C5OO6bgETBlVDwcv4eamGlCUltjsBU3gAbA=";
  };
  installPhase = ''
    mkdir -p $out/ranger-devicons
    cp -r $src/* $out/ranger-devicons
  '';
}
