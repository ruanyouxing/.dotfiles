{pkgs, ...}: let
  bad_apple = pkgs.callPackage ./plymouth.nix {};
  Grub-theme-particle = pkgs.callPackage ./grub-theme-particles.nix {};
in {
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
    initrd.kernelModules = ["amdgpu"];
    #    lanzaboote = {
    #      enable = true;
    #      pkiBundle = "/etc/secureboot";
    #    };
    loader = {
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
        configurationLimit = 5;
        gfxmodeEfi = "1920x1080";
        theme = Grub-theme-particle;
        splashImage = "${Grub-theme-particle}/background.jpg";
      };
    };
    supportedFilesystems = ["ntfs" "exfat"];
    plymouth = {
      enable = true;
      theme = "bad_apple";
      themePackages = [bad_apple];
    };
  };
  systemd.services.plymouth-quit.serviceConfig.ExecStartPre = "${pkgs.busybox}/bin/sleep 4";
}
