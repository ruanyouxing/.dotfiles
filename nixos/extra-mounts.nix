{
  fileSystems."/windows" = {
    device = "/dev/nvme0n1p2";
    fsType = "ntfs-3g";
    options = [
      "rw"
      "uid=1000"
    ];
  };
  fileSystems."/extras" = {
    device = "/dev/sda2";
    fsType = "ntfs-3g";
    options = [
      "rw"
      "uid=1000"
    ];
  };
  fileSystems."/sechgaem" = {
    device = "/dev/sdb1";
    fsType = "ntfs-3g";
    options = [
      "rw"
      "uid=1000"
    ];
  };
  fileSystems."/data" = {
    device = "/dev/sdc1";
    fsType = "ntfs-3g";
    options = [
      "rw"
      "uid=1000"
    ];
  };
}
