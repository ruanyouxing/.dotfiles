{
  pkgs,
  ...
}:
let
  droidcam-obs = pkgs.stdenv.mkDerivation {
    name = "droidcam-obs";
    src = pkgs.fetchurl {
      url = "https://github.com/dev47apps/droidcam-obs-plugin/releases/download/2.4.0/droidcam_obs_2.4.0_linux_flatpak.zip";
      sha256 = "sha256:2f5ad8eded1b3d46bf23300591b2dab13264a9f71a1836efe0d3fdae56ef57c7";
    };
    nativeBuildInputs = [ pkgs.unzip ];
    unpackPhase = ''
      mkdir -p $out/lib/obs-plugins
      unzip $src
      cp ./droidcam-obs/bin/64bit/droidcam-obs.so $out/lib/obs-plugins
    '';
  };
in
{
  # programs.obs-studio = {
  #   enable = true;
  #   plugins = [
  #     inputs.nixpkgs-wayland.packages.x86_64-linux.obs-wlrobs
  #     droidcam-obs
  #   ];
  # };
}
