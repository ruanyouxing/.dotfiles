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
    extraModprobeConfig = ''
      options v4l2loopback devices=1 video_nr=0 card_label="OBS-Virtual-Camera" exclusive_caps=1
    '';
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
        configurationLimit = 2;
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
