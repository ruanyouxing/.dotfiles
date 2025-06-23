{ pkgs, ... }:
{
  services.flameshot = {
    enable = true;
    package = pkgs.flameshot.override { enableWlrSupport = true; };
    settings = {
      showStartupLaunchMessage = false;
      # useGrimAdapter = true;
      uiColor = "#3DDCFF";
      jpegQuality = 100;
    };
  };
}
