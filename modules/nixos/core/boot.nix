{ pkgs, extraPkgs, catppuccinFlavor, ... }:
let
  grubTheme = pkgs.callPackage ../../../extra-pkgs/catppuccin-grub.nix { flavor = catppuccinFlavor; };
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
        theme = grubTheme;
        splashImage = "${grubTheme}/background.png";
      };
    };
  };
  environment.systemPackages = with pkgs; [ ntfs3g ];
  security.lockKernelModules = false;
}
