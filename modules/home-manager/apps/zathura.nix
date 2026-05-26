{
  programs.zathura = {
    enable = true;
    options = {
      recolor = false;
      recolor-keephue = false;
      incremental-search = false;
      scroll-page-aware = true;
      # smooth-scroll = true;
      scroll-step = 50;
      adjust-open = "width";
      selection-clipboard = "clipboard";
    };
    mappings = {
      "<PageUp>" = "scroll full_up";
      "<PageDown>" = "scroll full_down";
      "<BackSpace>" = "scroll full_up all";
      "<M-v>" = "scroll full_up";
      "<C-v>" = "scroll full_down";
      "+" = "zoom in";
      "-" = "zoom out";
      "q" = "quit";
      "w" = "adjust_window width";
      "z" = "adjust_window bestfit";
      "<Space>" = "navigate next";
      "<S-Space>" = "navigate previous";
      "b" = "toggle_statusbar";
      "<C-g>" = "abort";
    };
  };
}
