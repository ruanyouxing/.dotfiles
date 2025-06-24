{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [ ntfs3g ];
  boot.supportedFilesystems = [
    "ntfs"
    "exfat"
  ];
  fileSystems."/windows" = {
    device = "/dev/nvme0n1p2";
    fsType = "ntfs-3g";
    options = [
      "rw"
      "relatime"
      "user_id=0"
      "group_id=0"
    ];
  };
  fileSystems."/extras" = {
    device = "/dev/disk/by-uuid/4EAADE72AADE55D5";
    fsType = "ntfs-3g";
    options = [
      "rw"
      "relatime"
      "user_id=0"
      "group_id=0"
    ];
  };
  fileSystems."/sechgaem" = {
    device = "/dev/disk/by-uuid/2CCE6F8E5C7F678C";
    fsType = "ntfs-3g";
    options = [
      "rw"
      "relatime"
      "user_id=0"
      "group_id=0"
    ];
  };
  fileSystems."/data" = {
    device = "/dev/disk/by-uuid/EE726E4A726E179B";
    fsType = "ntfs-3g";
    options = [
      "rw"
      "relatime"
      "user_id=0"
      "group_id=0"
    ];
  };
  security.lockKernelModules = false;
}
