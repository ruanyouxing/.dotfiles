{ pkgs, ... }:
{
  programs.firefox = {
    enable = true;
    profiles.hungz = {
      settings = {
        "ui.key.menuAccessKeyFocuses" = false;
        "extensions.autoDisableScopes" = 0;
      };
      extensions.packages = with pkgs.nur.repos.rycee.firefox-addons; [
        surfingkeys
        ublock-origin
        catppuccin-web-file-icons
        firefox-color
        grammarly
      ];
    };
  };
}
