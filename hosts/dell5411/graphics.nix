{
  pkgs,
  inputs,
  ...
}:
let
  system = pkgs.stdenv.hostPlatform.system;
in
{
  hardware = {
    graphics = {
      extraPackages = with pkgs; [
        intel-media-driver
        vpl-gpu-rt
      ];
    };
  };
  environment.sessionVariables.LIBVA_DRIVER_NAME = "iHD";
  programs.hyprland.package = inputs.hyprland.packages.${system}.hyprland;
}
