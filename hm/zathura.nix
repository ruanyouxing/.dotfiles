{
  programs.zathura = {
    enable = true;
    options = {
      recolor = true;
      recolor-keephue = false;
      incremental-search = false;
      scroll-page-aware = true;
      # smooth-scroll = true;
      scroll-step = 50;
      adjust-open = "width";
      selection-clipboard = "clipboard";
      default-bg = "#24283b";
      default-fg = "#a9b1d6";
      statusbar-fg = "#a9b1d6";
      statusbar-bg = "#24283b";
      # inputbar_bg = "#1a1b26";
      # inputbar_fg = "#73daca";
      notification-error-bg = "#1a1b26";
      notification-error-fg = "#f7768e";
      notification-warning-bg = "#1a1b26";
      notification-warning-fg = "#f7768e";
      highlight-color = "#e0af68";
      highlight-active-color = "#9aa5ce";
      completion-bg = "#24283b";
      completion-fg = "#a9b1d6";
      completion-highlight-fg = "#9aa5ce";
      completion-highlight-bg = "#24283b";
      recolor-lightcolor = "#1a1b26";
      recolor-darkcolor = "#a9b1d6";
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
