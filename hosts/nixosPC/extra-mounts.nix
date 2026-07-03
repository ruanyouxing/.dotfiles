{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [ ntfs3g ];
  boot.supportedFilesystems = [
    "ntfs"
    "exfat"
  ];
  fileSystems."/windows" = {
    device = "/dev/disk/by-uuid/AA1215231214F5D3";
    fsType = "ntfs-3g";
    options = [
      "rw"
      "relatime"
      "user_id=0"
      "group_id=0"
    ];
  };
  fileSystems."/data" = {
    device = "/dev/disk/by-uuid/4EAADE72AADE55D5";
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
