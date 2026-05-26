{ stdenv, fetchFromGitHub, flavor ? "mocha", ... }:
let
  themeDir = "catppuccin-${flavor}-grub-theme";
in
stdenv.mkDerivation {
  name = "catppuccin-grub-${flavor}";
  src = fetchFromGitHub {
    owner = "catppuccin";
    repo = "grub";
    rev = "0a37ab19f654e77129b409fed371891c01ffd0b9";
    hash = "sha256-jgM22pvCQvb0bjQQXoiqGMgScR9AgCK3OfDF5Ud+/mk=";
  };
  installPhase = ''
    mkdir -p $out
    cp -r src/${themeDir}/* $out
  '';
}
