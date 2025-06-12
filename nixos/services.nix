{pkgs,...}:{
  networking.networkmanager.enable = true;
  programs.dconf.enable = true;
  programs.vim.enable = true;
  services = {
    # gvfs.enable = true;
    # tumbler.enable = true;
    dbus.enable = true;
    chrony.enable = true;
    openssh.enable = true;
  };
  environment.systemPackages = with pkgs; [
    edk2
    wget
    killall
    python311Packages.dbus-python
  ];
}
