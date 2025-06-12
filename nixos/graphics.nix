{
  pkgs,
  inputs,
  ...
}: let
  system = pkgs.stdenv.hostPlatform.system;
  pkgs-unstable = inputs.hyprland.inputs.nixpkgs.legacyPackages.${system};
in {
  hardware = {
    enableAllFirmware = true;
    graphics = {
      enable = true;
      enable32Bit = true;
      package = pkgs-unstable.mesa;
      package32 = pkgs-unstable.pkgsi686Linux.mesa;
    };
  };
  console = {
    earlySetup = true;
    font = "${pkgs.terminus_font}/share/consolefonts/ter-116n.psf.gz";
    packages = with pkgs; [terminus_font];
    keyMap = "us";
  };
  services = {
    displayManager = {
      autoLogin.enable = true;
      autoLogin.user = "hungz";
    };
    xserver = {
      enable = true;
      displayManager.startx.enable = true;
      xkb = {
        layout = "us";
        variant = "";
      };
      #videoDrivers = ["amdgpu"];
    };
  };
  xdg.portal = {
    enable = true;
    extraPortals = with pkgs; [
      xdg-desktop-portal-gtk
      xdg-desktop-portal-wlr
    ];
  };
  environment.sessionVariables  = {
    GTK_USE_PORTAL = "1";
  };
  nix.settings = {
    substituters = ["https://hyprland.cachix.org"];
    trusted-public-keys = ["hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc="];
  };
  programs.hyprland = {
    enable = true;
    package = inputs.hyprland.packages.${system}.hyprland;
    portalPackage = inputs.hyprland.packages.${system}.xdg-desktop-portal-hyprland;
  };
}
