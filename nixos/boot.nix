{
  pkgs,
  inputs,
  ...
}:
let
  bad_apple = inputs.bad-apple-plymouth.packages.${pkgs.system}.default;
  Grub-theme-particle = pkgs.callPackage ./grub-theme-particles.nix { };
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
    initrd.kernelModules = [
      "amdgpu"
      "ntfs3"
    ];
    #    lanzaboote = {
    #      enable = true;
    #      pkiBundle = "/etc/secureboot";
    #    };
    loader = {
      timeout = 10;
      #      systemd-boot.enable = lib.mkForce false;
      #      systemd-boot.configurationLimit = 1;
      efi = {
        canTouchEfiVariables = false;
        efiSysMountPoint = "/boot";
      };
      grub = {
        efiSupport = true;
        device = "nodev";
        efiInstallAsRemovable = true;
        configurationLimit = 10;
        gfxmodeEfi = "1920x1080";
        theme = Grub-theme-particle;
        splashImage = "${Grub-theme-particle}/background.jpg";
      };
    };
    plymouth = {
      enable = true;
      theme = "bad_apple";
      themePackages = [ bad_apple ];
    };
  };
  systemd.services.plymouth-quit.serviceConfig.ExecStartPre = "${pkgs.busybox}/bin/sleep 4";
}
