{
  stdenv,
  ...
}:
stdenv.mkDerivation {
  name = "stretch-pro";
  src = ./fonts/fontpacks/StretchPro.otf;
  dontUnpack = true;
  phases = ["installPhase"];
  installPhase = ''
    install -Dm644 $src -t $out/share/fonts/opentype
  '';
}
