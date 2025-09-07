{
  pkgs,
  inputs,
  ...
}:
let
  system = pkgs.stdenv.hostPlatform.system;
  pkgs-unstable = inputs.hyprland.inputs.nixpkgs.legacyPackages.${system};
  username = "hungz";
in
{
  hardware = {
    graphics = {
      enable = true;
      enable32Bit = true;
      package = pkgs-unstable.mesa;
      package32 = pkgs-unstable.pkgsi686Linux.mesa;
      extraPackages = [ pkgs.amdvlk ];
    };
  };
  console = {
    earlySetup = true;
    font = "${pkgs.terminus_font}/share/consolefonts/ter-116n.psf.gz";
    packages = with pkgs; [ terminus_font ];
    keyMap = "us";
  };
  services = {
    greetd = {
      enable = true;
      vt = 3;
      settings = {
        initial_session = {
          user = username;
          command = "Hyprland";
        };
        default_session = {
          user = username;
          command = "${pkgs.greetd.tuigreet}/bin/tuigreet --time --time-format '%I:%M %p | %a * %h | %F' --cmd 'uwsm start hyprland-uwsm.desktop'";
        };
      };
    };
    displayManager = {
      # autoLogin.enable = true;
      # autoLogin.user = "hungz";
    };
    xserver = {
      enable = true;
      displayManager.startx.enable = true;
      xkb = {
        layout = "us";
        variant = "";
      };
      videoDrivers = [ "amdgpu" ];
    };
  };
  environment.sessionVariables = {
    GTK_USE_PORTAL = "1";
  };
  nix.settings = {
    substituters = [ "https://hyprland.cachix.org" ];
    trusted-public-keys = [ "hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc=" ];
  };
  xdg.portal = {
    enable = true;
    extraPortals = with pkgs; [
      xdg-desktop-portal-gtk
    ];
    config = {
      common = {
        default = [
          "hyprland"
          "gtk"
        ];
      };
    };
  };
  qt.enable = true;
  programs.hyprland = {
    enable = true;
    withUWSM = true;
    # package = inputs.hyprland.packages.${system}.hyprland;
    portalPackage = inputs.hyprland.packages.${system}.xdg-desktop-portal-hyprland;
  };
  programs.gdk-pixbuf.modulePackages = [ pkgs.librsvg ];
  environment.sessionVariables.NIXOS_OZONE_WL = "1";
  services = {
    gvfs.enable = true;
    tumbler.enable = true;
  };
  programs.obs-studio = {
    enable = true;
    plugins = with pkgs.obs-studio-plugins; [
      wlrobs
      obs-pipewire-audio-capture
      droidcam-obs
    ];
    enableVirtualCamera = true;
  };
}
