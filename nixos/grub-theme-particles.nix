{
  stdenv,
  fetchFromGitHub,
  bash,
  ...
}:
stdenv.mkDerivation {
  name = "Grub-theme-particle";
  src = fetchFromGitHub {
    owner = "yeyushengfan258";
    repo = "Particle-circle-grub-theme";
    rev = "f27991237562f93aacc3f333be4284430889f5bb";
    hash = "sha256-3yusy7V+ASj6vS7yPe9xhi2YY9TGFKKJpZQwZqITJ0U=";
  };
  nativeBuildInputs = [bash];
  dontStrip = true;
  dontPatchELF = true;
  installPhase = ''
    bash generate.sh --theme sidebar
    mkdir -p $out
    cp -r Particle-circle-sidebar/* $out
  '';
}
