{
  stdenv,
  fetchFromGitHub,
  ...
}:
stdenv.mkDerivation {
  name = "bad-apple-plymouth";
  src = fetchFromGitHub {
    owner = "ruanyouxing";
    repo = "bad-apple-plymouth";
    rev = "8914df276f544563baa0d9432e172ffde1ae6b5a";
    hash = "sha256-tg91VHay1Qf0xPe/gcYF0I/VI5PunmTSMCzdBN3hotI=";
  };
  preferLocalBuild = true;
  allowSubstitutes = false;
  installPhase = ''
    mkdir -p $out/share/plymouth/themes/bad_apple
    cp -r $src/* $out/share/plymouth/themes/bad_apple/
    sed -i "s@\/usr\/@$out\/@"  $out/share/plymouth/themes/bad_apple/bad_apple.plymouth
  '';
}
