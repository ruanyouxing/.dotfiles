{ inputs, ... }:
{
  programs.obs-studio = {
    enable = true;
    plugins = [ inputs.nixpkgs-wayland.packages.x86_64-linux.obs-wlrobs ];
  };
}
