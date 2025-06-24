{ pkgs, ... }:
{
  networking.networkmanager.enable = true;
  programs.dconf.enable = true;
  programs.vim.enable = true;
  services = {
    dbus.enable = true;
    chrony.enable = true;
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
  ];
}
