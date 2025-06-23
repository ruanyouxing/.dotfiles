{ pkgs, ... }:
{
  services.flameshot = {
    enable = true;
    package = pkgs.flameshot.override { enableWlrSupport = true; };
    settings = {
      General = {
        showStartupLaunchMessage = false;
        uiColor = "#3DDCFF";
        jpegQuality = 100;
        disabledGrimWarning = true;
      };
    };
  };
}
