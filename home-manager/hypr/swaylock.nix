{pkgs, ...}: let
  src = pkgs.fetchFromGitHub {
    owner = "samchouse";
    repo = "swaylock-effects-improved";
    rev = "0554651acc2a3bd3c29d6d9ce71c9b1f30823b9f";
    hash = "sha256-WEb3++MenOQLc+sT1J4yq7C979UO30hoiXPPlPb+3qU=";
  };
in {
  programs.swaylock = {
    enable = true;
    package = pkgs.swaylock-effects.overrideAttrs {
      inherit src;
    };
    settings = {
      font = "JetBrainsMono Nerd Font";
      font-size = 27;
      indicator-radius = 130;
      indicator-thickness = 15;
      indicator-x-position = 230;
      indicator-y-position = 830;
      line-uses-inside = true;
      text-color = "#e5e5e5";
      text-ver-color = "#f1cf0f";
      text-wrong-color = "#E74C3C";
      text-clear-color = "#A93226";
      layout-text-color = "#A3D5FF";
      text-caps-lock-color = "#F39C12";
      inside-color = "#1b3d5a";
      inside-ver-color = "#3a4a20";
      inside-wrong-color = "#FDECEA";
      inside-clear-color = "#F9EBEA";
      inside-caps-lock-color = "#FEF5E7";
      layout-bg-color = "#233647";
      key-hl-color = "#0f6cbd";
      ring-color = "#2c5a78";
      ring-ver-color = "#d4ac0d";
      ring-wrong-color = "#F5C6C4";
      ring-clear-color = "#D98880";
      ring-caps-lock-color = "#D68910";
      layout-border-color = "#5B92B0";
      bs-hl-color = "#1f3443";
      caps-lock-bs-hl-color = "#1f3443";
      ignore-empty-password = true;
      image = "~/.dotfiles/backgrounds/lockscreen.png";
      scaling = "fill";
      indicator-caps-lock = true;
      clock = true;
      timestr = "%-l:%M %p";
      datestr = "%a,%-e %B,%Y";
      indicator = true;
      effect-blur = "5x5";
      indicator-idle-visible = true;
      show-failed-attempts = true;
      daemonize = true;
      show-keyboard-layout = true;
      # fade-in = 0.9;
    };
  };
}
