{ pkgs, extraPkgs, catppuccinFlavor, ... }:
let
  grubTheme = pkgs.callPackage ../../../extra-pkgs/catppuccin-grub.nix { flavor = catppuccinFlavor; };
in
{
  boot = {
    supportedFilesystems = [
      "ntfs"
      "exfat"
    ];
    initrd.kernelModules = [
      "ntfs3"
    ];
    kernelModules = [
      "ntfs3"
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
