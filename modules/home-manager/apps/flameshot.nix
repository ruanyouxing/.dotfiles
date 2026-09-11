{ pkgs, ... }:
{
  services.flameshot = {
    enable = true;
    package = pkgs.flameshot.override { enableWlrSupport = true; };
    settings = {
      General = {
        showStartupLaunchMessage = false;
        uiColor = "#a78bfa";
        jpegQuality = 100;
        # disabledGrimWarning = true;
        # useGrimAdapter = true;
      };
    };
  };
}
