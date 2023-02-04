{ config, pkgs, ... }:
{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];

  boot.loader.efi.canTouchEfiVariables = true;
  boot.loader.efi.efiSysMountPoint = "/boot";
  boot.loader.grub.efiSupport = true;
  boot.loader.grub.enable = true;
  boot.loader.grub.devices = ["nodev"];


  networking.hostName = "nixos"; # Define your hostname.
 # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  networking.networkmanager.enable = true;

  time.timeZone = "Asia/Ho_Chi_Minh";

  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "vi_VN";
    LC_IDENTIFICATION = "vi_VN";
    LC_MEASUREMENT = "vi_VN";
    LC_MONETARY = "vi_VN";
    LC_NAME = "vi_VN";
    LC_NUMERIC = "vi_VN";
    LC_PAPER = "vi_VN";
    LC_TELEPHONE = "vi_VN";
    LC_TIME = "vi_VN";
  };


  services.xserver.desktopManager.plasma5.enable = true;
   services.xserver.windowManager.bspwm.enable = true;
   services.xserver.windowManager.i3.enable = true;

  # Configure keymap in X11

  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Enable sound with pipewire.
  sound.enable = true;
  hardware.pulseaudio.enable = false;
  hardware.bluetooth.enable = true;
  services.blueman.enable = true;
  security.rtkit.enable = true;
  security.sudo.extraRules = [
	{
		groups = ["wheel"];
		commands = [{command = "ALL"; options = ["NOPASSWD"];}];
}
];
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    #jack.enable = true;
    #media-session.enable = true;
  };

  services.xserver.libinput.enable = true;

  users.users.hungz = {
    isNormalUser = true;
    shell = pkgs.zsh;
    description = "Hung Nguyen";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [
      firefox
      kate
    ];
  };

  nixpkgs.config.allowUnfree = true;

  environment.systemPackages = with pkgs; [
   vim
   wget
   bspwm
   fish
   doas
   vulkan-tools
   vulkan-loader
   home-manager
   ly
  ];
   programs.gnupg.agent = {
     enable = true;
     enableSSHSupport = true;
   };
   programs.zsh.enable = true;
   programs.fish.enable = true;

  services.openssh.enable = true;
  
  services.xserver = {
    enable = true;
    layout = "us";
    displayManager.autoLogin.enable = true;
    displayManager.autoLogin.user = "hungz";
    displayManager.sddm = {
      enable = true;
    };
  };
  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;
  system.autoUpgrade.enable = true;
  nix = {
	autoOptimiseStore = true;
	gc.automatic = true;
	gc.dates = "weekly";
	gc.options = "--delete-older-than 30d";
  };
  nix.settings.experimental-features = ["nix-command" "flakes"];
  system.stateVersion = "22.11"; # Did you read the comment?
}
