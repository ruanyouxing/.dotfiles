{
  stdenv,
  ...
}:
stdenv.mkDerivation {
  name = "sweet-cursors";
  src = ./Sweet-cursors;
  installPhase = ''
  mkdir -p $out/share/icons/Sweet-cursors
  cp -r $src/* $out/share/icons/Sweet-cursors/
  '';
}
