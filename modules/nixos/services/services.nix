{
  pkgs,
  options,
  inputs,
  ...
}: {
  imports = [inputs.nix-index-database.nixosModules.default];
  networking.networkmanager.enable = true;
  programs.nix-ld.enable = true;
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
    v4l-utils
    android-tools
  ];
  networking.networkmanager.insertNameservers = ["1.1.1.1" "8.8.8.8"];
  networking.timeServers = options.networking.timeServers.default ++ ["0.asia.pool.ntp.org"];
  programs.localsend = {
    enable = true;
    openFirewall = true;
  };
  programs.nix-index-database.comma.enable = true;
}
