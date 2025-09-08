{ pkgs, ... }:
{
  hardware.graphics.extraPackages = [ pkgs.amdvlk ];
  services.xserver.videoDrivers = [ "amdgpu" ];
}
