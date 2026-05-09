{
  pkgs,
  options,
  ...
}:
{
  networking.networkmanager.enable = true;
  programs.dconf.enable = true;
  programs.vim.enable = true;
  services = {
    dbus.enable = true;
    ntp.enable = true;
    openssh.enable = true;
  };
  hardware.opentabletdriver = {
    enable = true;
    daemon.enable = true;
  };
  environment.systemPackages = with pkgs; [
    edk2
    wget
    killall
    python311Packages.dbus-python
    jmtpfs
    v4l-utils
    android-tools
  ];
  networking.timeServers = options.networking.timeServers.default ++ [ "0.asia.pool.ntp.org" ];
}
