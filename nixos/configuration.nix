{pkgs, ...}: {
  imports = [
    ./hardware-configuration.nix
  ];
  boot = {
    kernelParams = ["quiet" "splash" "rd.udev.log_priority=3"];
    initrd.kernelModules = ["amdgpu"];
    loader = {
      efi.canTouchEfiVariables = true;
      grub = {
        efiSupport = true;
        device = "nodev";
        splashImage = /home/hungz/.dotfiles/nixos/wallpaper.png;
      };
    };
    supportedFilesystems = ["ntfs" "exfat"];
    plymouth = {
      enable = true;
    };
  };
  networking.hostName = "nixos"; # Define your hostname.
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
  i18n.inputMethod = {
    enabled = "ibus";
    ibus.engines = with pkgs.ibus-engines; [bamboo mozc libpinyin];
  };
  console = {
    earlySetup = true;
    font = "${pkgs.terminus_font}/share/consolefonts/ter-116n.psf.gz";
    packages = with pkgs; [terminus_font];
    keyMap = "us";
  };
  services.dbus.enable = true;
  services.xserver = {
    enable = true;
    layout = "us";
    xkbVariant = "";
    displayManager.startx.enable = true;
    videoDrivers = ["amdgpu"];
  };
  services.printing.enable = true;
  services.blueman.enable = true;
  services.chrony.enable = true;
  sound.enable = true;
  hardware.enableAllFirmware = true;
  hardware.bluetooth.enable = true;
  hardware = {
    opengl = {
      enable = true;
      driSupport = true;
      driSupport32Bit = true;
    };
    pulseaudio = {
      enable = true;
      support32Bit = true;
      extraConfig = "load-module module-combine-sink";
    };
  };
  security.rtkit.enable = true;
  programs.zsh.enable = true;
  users.users.hungz = {
    isNormalUser = true;
    description = "hungz";
    shell = pkgs.zsh;
    extraGroups = ["networkmanager" "wheel" "audio"];
    packages = with pkgs; [
      firefox
    ];
  };
  services.xserver.displayManager.autoLogin.enable = true;
  services.xserver.displayManager.autoLogin.user = "hungz";
  nixpkgs.config.allowUnfree = true;
  environment.systemPackages = with pkgs; [
    vim
    wget
    python3
    killall
    python311Packages.dbus-python
  ];
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  services.openssh.enable = true;
  security.sudo.extraRules = [
    {
      users = ["hungz"];
      commands = [
        {
          command = "ALL";
          options = ["NOPASSWD"];
        }
      ];
    }
  ];
  nix = {
    settings = {
      experimental-features = ["nix-command" "flakes"];
      auto-optimise-store = true;
      substituters = ["https://hyprland.cachix.org"];
      trusted-public-keys = ["hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc="];
    };
    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 7d";
    };
  };
  xdg.portal = {
    enable = true;
    gtkUsePortal = true;
    extraPortals = with pkgs; [
      xdg-desktop-portal-gtk
      xdg-desktop-portal-wlr
    ];
  };
  system.stateVersion = "23.05";
}
