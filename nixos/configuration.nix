{pkgs, ...}: let
  bad_apple = pkgs.callPackage ./plymouth.nix {};
in {
  imports = [
    ./hardware-configuration.nix
  ];
  boot = {
    kernelParams = [
      "loglevel=3"
      "quiet"
      "splash"
      "amdgpu"
      "radeon.cik_support=0"
      "amdgpu.cik_support=1"
      "amdgpu.si_support=1"
      "radeon.si_support=0"
      "amdgpu.modeset=1"
      "rd.udev.log_priority=3"
      "vt.global_cursor_default=0"
    ];
    initrd.kernelModules = ["amdgpu"];
    loader = {
      efi.canTouchEfiVariables = true;
      grub = {
        efiSupport = true;
        device = "nodev";
        configurationLimit = 1;
      };
    };
    supportedFilesystems = ["ntfs" "exfat"];
    plymouth = {
      enable = true;
      theme = "bad_apple";
      themePackages = [bad_apple];
    };
  };
  systemd.services.plymouth-quit.serviceConfig.ExecStartPre = "${pkgs.busybox}/bin/sleep 4";
  console = {
    earlySetup = true;
    font = "${pkgs.terminus_font}/share/consolefonts/ter-116n.psf.gz";
    packages = with pkgs; [terminus_font];
    keyMap = "us";
  };
  environment.systemPackages = with pkgs; [
    vim
    wget
    python3
    killall
    python311Packages.dbus-python
  ];
  sound.enable = true;
  hardware = {
    enableAllFirmware = true;
    bluetooth.enable = true;
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
  time.timeZone = "Asia/Ho_Chi_Minh";
  i18n = {
    defaultLocale = "en_US.UTF-8";
    extraLocaleSettings = {
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
    inputMethod = {
      enabled = "ibus";
      ibus.engines = with pkgs.ibus-engines; [bamboo mozc libpinyin];
    };
  };
  networking = {
    hostName = "nixos";
    networkmanager.enable = true;
  };
  nixpkgs.config.allowUnfree = true;
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
  services = {
    dbus.enable = true;
    xserver = {
      enable = true;
      layout = "us";
      xkbVariant = "";
      displayManager = {
        startx.enable = true;
        autoLogin.enable = true;
        autoLogin.user = "hungz";
      };

      videoDrivers = ["amdgpu"];
    };
    printing.enable = true;
    blueman.enable = true;
    chrony.enable = true;
    openssh.enable = true;
  };
  security.rtkit.enable = true;
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
