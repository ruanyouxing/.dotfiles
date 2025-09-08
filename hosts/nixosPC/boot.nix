{
  pkgs,
  inputs,
  ...
}:
let
  bad_apple = inputs.bad-apple-plymouth.packages.${pkgs.system}.default;
in
{
  boot = {
    kernelParams = [
      "loglevel=3"
      "quiet"
      "splash"
      "amdgpu"
      "radeon.cik_support=0"
      "amdgpu.cik_support=1"
      "amdgpu.si_support=1"
      "radeon.si_support=0"
      "amdgpu.modeset=1"
      "rd.udev.log_priority=3"
      "vt.global_cursor_default=0"
    ];
    kernelModules = [
      "amdgpu"
      "ntfs3"
      "v4l2loopback"
    ];
    extraModulePackages = [ pkgs.linuxPackages.v4l2loopback ];
    #    lanzaboote = {
    #      enable = true;
    #      pkiBundle = "/etc/secureboot";
    #    };
    plymouth = {
      enable = true;
      theme = "bad_apple";
      themePackages = [ bad_apple ];
    };
  };
  systemd.services.plymouth-quit.serviceConfig.ExecStartPre = "${pkgs.busybox}/bin/sleep 4";
}
