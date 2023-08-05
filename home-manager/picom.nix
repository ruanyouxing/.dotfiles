{pkgs, ...}: {
  services.picom = {
    enable = true;
    package = pkgs.picom.overrideAttrs (o: {
      src = pkgs.fetchFromGitHub {
        repo = "picom";
        owner = "ibhagwan";
        rev = "44b4970f70d6b23759a61a2b94d9bfb4351b41b1";
        sha256 = "0iff4bwpc00xbjad0m000midslgx12aihs33mdvfckr75r114ylh";
      };
    });
    activeOpacity = 1;
    inactiveOpacity = 1;
    backend = "glx";
    extraArgs = ["--experimental-backends"];
    fade = true;
    fadeDelta = 10;
    fadeSteps = [0.015 0.1];
    opacityRules = [
      "90:class_g    = 'Polybar'"
      "80:class_g    = 'kitty'"
      "80:class_g    = 'Thunar'"
      "70:class_g    = 'Rofi'"
      "80:class_g    = 'discord'"
      "80:class_g    = 'Google-chrome'"
      "70:class_g    = 'Spotify'"
    ];
    shadow = true;
    shadowExclude = [
      "name = 'Notification'"
      "class_g = 'Conky'"
      "class_g ?= 'Notify-osd'"
      "class_g = 'Cairo-clock'"
      "class_g = 'slop'"
      "class_g = 'Polybar'"
      "_GTK_FRAME_EXTENTS@:c"
    ];
    shadowOffsets = [(-15) (-15)];
    shadowOpacity = 0.75;
    wintypes = {
      normal = {full-shadow = true;};
      menu = {full-shadow = true;};
      tooltip = {
        fade = true;
        shadow = false;
        focus = true;
      };
      dock = {shadow = false;};
      dnd = {shadow = false;};
      popup_menu = {full-shadow = true;};
      utility = {full-shadow = true;};
      toolbar = {full-shadow = true;};
      notification = {opacity = 1;};
    };
    settings = {
      animations = true;
      corner-radius = 0;
      rounded-corners-exclude = [
        "class_g = 'Rofi'"
      ];
      round-borders = 5;
      round-borders-exclude = [];
      round-borders-rule = [
        "15:class_g     = 'Signal'"
      ];
      shadow-radius = 12;
      fading = true;
      frame-opacity = 1.0;
      inactive-opacity-override = false;
      blur-method = "dual_kawase";
      blur-size = 12;
      #blur-background = true;
      # blur-background-frame = false;
      # blur-background-fixed = false;
      blur = {
        method = "dual_kawase";
        strength = 5;
        deviation = 1.0;
        background = false;
        background-frame = false;
        background-fixed = false;
        kern = "3x3box";
      };
      blur-background-exclude = [
        "class_g = 'dwm'"
        "_GTK_FRAME_EXTENTS@:c"
        "class_g = 'picom'"
      ];
      daemon = false;
      vsync = true;
      mark-wmwin-focused = true;
      mark-ovredir-focused = true;
      detect-rounded-corners = true;
      detect-client-opacity = true;
      detect-transient = true;
      detect-client-leader = true;
      use-damage = true;
      log-level = "info";
    };
  };
}
