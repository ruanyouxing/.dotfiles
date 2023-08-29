{
  stdenv,
  ...
}:
stdenv.mkDerivation {
  name = "sweet-cursors";
  src = ./Sweet-cursors.tar.xz;
  installPhase = ''
  mkdir -p $out/share/icons/
  tar -xf $src -C $out/share/icons
  '';
}
