{ pkgs, ... }:
let
  Grub-theme-particle = pkgs.callPackage ../../../grub-theme-particles.nix { };
in
{
  boot = {
    extraModprobeConfig = ''
      options v4l2loopback devices=1 video_nr=0 card_label="OBS-Virtual-Camera" exclusive_caps=1
    '';
    supportedFilesystems = [
      "ntfs"
      "exfat"
    ];
    initrd.kernelModules = [
      "ntfs3"
    ];
    kernelModules = [
      "ntfs3"
      "v4l2loopback"
    ];
    loader = {
      timeout = 10;
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
  };
  environment.systemPackages = with pkgs; [ ntfs3g ];
  security.lockKernelModules = false;
}
