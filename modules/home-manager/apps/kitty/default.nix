{pkgs, ...}: {
  programs.kitty = {
    enable = true;

    settings = {
      # Font
      font_family = "JetBrains Mono Nerd Font";
      bold_font = "auto";
      italic_font = "auto";
      bold_italic_font = "auto";
      font_size = 18;
      force_ltr = false;
      adjust_line_height = 0;
      adjust_column_width = 0;
      adjust_baseline = 0;
      disable_ligatures = "never";
      font_features = "FiraCode-Retina +zero +onum";
      box_drawing_scale = "0.001, 1, 1.5, 2";

      # Cursor
      cursor_shape = "block";
      cursor_beam_thickness = 1.5;
      cursor_underline_thickness = 2.0;
      cursor_blink_interval = 0;
      cursor_stop_blinking_after = 15.0;

      # Scrolling
      scrollback_lines = 2000;
      scrollback_pager = "less --chop-long-lines --RAW-CONTROL-CHARS +INPUT_LINE_NUMBER";
      scrollback_pager_history_size = 0;
      scrollback_fill_enlarged_window = false;

      # Mouse
      wheel_scroll_multiplier = 5.0;
      wheel_scroll_min_lines = 1;
      touch_scroll_multiplier = 1.0;
      mouse_hide_wait = 3.0;

      # URL
      url_style = "curly";
      open_url_with = "default";
      url_prefixes = "file ftp ftps gemini git gopher http https irc ircs kitty mailto news sftp ssh";
      detect_urls = true;

      # Selection
      copy_on_select = false;
      paste_actions = "quote-urls-at-prompt";
      strip_trailing_spaces = "never";
      select_by_word_characters = "@-./_~?&=%+#";
      click_interval = -1.0;

      # Focus / pointer
      focus_follows_mouse = false;
      pointer_shape_when_grabbed = "arrow";
      default_pointer_shape = "beam";
      pointer_shape_when_dragging = "beam";
      clear_all_mouse_actions = false;

      # Performance
      repaint_delay = 10;
      input_delay = 3;
      sync_to_monitor = true;

      # Bell
      enable_audio_bell = false;
      visual_bell_duration = 0.0;
      visual_bell_color = "none";
      window_alert_on_bell = false;
      bell_on_tab = "🔔 ";
      command_on_bell = "none";
      bell_path = "none";

      # Window
      remember_window_size = true;
      initial_window_width = 640;
      initial_window_height = 400;
      enabled_layouts = "*";
      window_resize_step_cells = 2;
      window_resize_step_lines = 2;
      window_border_width = "0.5pt";
      draw_minimal_borders = true;
      window_margin_width = 0;
      single_window_margin_width = -1;
      window_padding_width = 0;
      placement_strategy = "center";
      inactive_text_alpha = 1.0;
      hide_window_decorations = false;
      window_logo_path = "none";
      window_logo_position = "bottom-right";
      window_logo_alpha = 0.5;
      resize_debounce_time = 0.1;
      resize_in_steps = false;
      visual_window_select_characters = "1234567890ABCDEFGHIJKLMNOPQRSTUVWXYZ";
      confirm_os_window_close = 0;

      # Tab bar
      tab_bar_edge = "bottom";
      tab_bar_margin_width = 0.0;
      tab_bar_margin_height = "0.0 0.0";
      tab_bar_style = "powerline";
      tab_bar_align = "left";
      tab_bar_min_tabs = 2;
      tab_switch_strategy = "previous";
      tab_fade = "0.25 0.5 0.75 1";
      tab_separator = " ┇";
      tab_powerline_style = "angled";
      tab_activity_symbol = "none";
      tab_title_template = "{index}: {title.split('/')[-1]}";
      active_tab_title_template = "{index}: {title.split('/')[-1]}";
      active_tab_font_style = "bold-italic";
      inactive_tab_font_style = "normal";
      tab_bar_margin_color = "none";

      # Misc
      background_opacity = 1.0;
      background_image = "none";
      background_image_layout = "tiled";
      background_image_linear = false;
      dynamic_background_opacity = false;
      background_tint = 0.0;
      dim_opacity = 0.75;
      shell = ".";
      editor = ".";
      close_on_child_death = false;
      allow_remote_control = true;
      listen_on = "none";
      update_check_interval = 24;
      startup_session = "none";
      clipboard_control = "write-clipboard write-primary read-clipboard-ask read-primary-ask";
      clipboard_max_size = 64;
      allow_hyperlinks = true;
      allow_cloning = "ask";
      clone_source_strategies = "venv,conda,env_var,path";
      term = "xterm-kitty";
      wayland_titlebar_color = "system";
      linux_display_server = "auto";
      kitty_mod = "ctrl+shift";
      clear_all_shortcuts = false;
    };

    keybindings = {
      # Copy / paste
      "kitty_mod+c" = "copy_to_clipboard";
      "cmd+c" = "copy_to_clipboard";
      "kitty_mod+v" = "paste_from_clipboard";
      "cmd+v" = "paste_from_clipboard";
      "kitty_mod+s" = "paste_from_selection";
      "shift+insert" = "paste_from_selection";
      "kitty_mod+o" = "pass_selection_to_program";

      # Scrolling
      "kitty_mod+up" = "scroll_line_up";
      "kitty_mod+k" = "scroll_line_up";
      "opt+cmd+page_up" = "scroll_line_up";
      "cmd+up" = "scroll_line_up";
      "kitty_mod+down" = "scroll_line_down";
      "kitty_mod+j" = "scroll_line_down";
      "opt+cmd+page_down" = "scroll_line_down";
      "cmd+down" = "scroll_line_down";
      "kitty_mod+page_up" = "scroll_page_up";
      "cmd+page_up" = "scroll_page_up";
      "kitty_mod+page_down" = "scroll_page_down";
      "cmd+page_down" = "scroll_page_down";
      "kitty_mod+home" = "scroll_home";
      "cmd+home" = "scroll_home";
      "kitty_mod+end" = "scroll_end";
      "cmd+end" = "scroll_end";
      "kitty_mod+z" = "scroll_to_prompt -1";
      "kitty_mod+x" = "scroll_to_prompt 1";
      "kitty_mod+h" = "show_scrollback";
      "kitty_mod+g" = "show_last_command_output";

      # Windows
      "kitty_mod+enter" = "new_window";
      "cmd+enter" = "new_window";
      "kitty_mod+n" = "new_os_window";
      "cmd+n" = "new_os_window";
      "kitty_mod+w" = "close_window";
      "shift+cmd+d" = "close_window";
      "kitty_mod+]" = "next_window";
      "kitty_mod+[" = "previous_window";
      "kitty_mod+f" = "move_window_forward";
      "kitty_mod+b" = "move_window_backward";
      "kitty_mod+`" = "move_window_to_top";
      "kitty_mod+r" = "start_resizing_window";
      "cmd+r" = "start_resizing_window";
      "kitty_mod+1" = "first_window";
      "cmd+1" = "first_window";
      "kitty_mod+2" = "second_window";
      "cmd+2" = "second_window";
      "kitty_mod+3" = "third_window";
      "cmd+3" = "third_window";
      "kitty_mod+4" = "fourth_window";
      "cmd+4" = "fourth_window";
      "kitty_mod+5" = "fifth_window";
      "cmd+5" = "fifth_window";
      "kitty_mod+6" = "sixth_window";
      "cmd+6" = "sixth_window";
      "kitty_mod+7" = "seventh_window";
      "cmd+7" = "seventh_window";
      "kitty_mod+8" = "eighth_window";
      "cmd+8" = "eighth_window";
      "kitty_mod+9" = "ninth_window";
      "cmd+9" = "ninth_window";
      "kitty_mod+0" = "tenth_window";
      "kitty_mod+f7" = "focus_visible_window";
      "kitty_mod+f8" = "swap_with_window";

      # Tabs
      "kitty_mod+right" = "next_tab";
      "shift+cmd+]" = "next_tab";
      "ctrl+tab" = "next_tab";
      "kitty_mod+left" = "previous_tab";
      "shift+cmd+[" = "previous_tab";
      "ctrl+shift+tab" = "previous_tab";
      "kitty_mod+t" = "new_tab";
      "cmd+t" = "new_tab";
      "kitty_mod+q" = "close_tab";
      "cmd+w" = "close_tab";
      "shift+cmd+w" = "close_os_window";
      "kitty_mod+." = "move_tab_forward";
      "kitty_mod+," = "move_tab_backward";
      "kitty_mod+alt+t" = "set_tab_title";
      "shift+cmd+i" = "set_tab_title";
      "kitty_mod+l" = "next_layout";

      # Font size
      "kitty_mod+equal" = "change_font_size all +2.0";
      "kitty_mod+plus" = "change_font_size all +2.0";
      "kitty_mod+kp_add" = "change_font_size all +2.0";
      "cmd+plus" = "change_font_size all +2.0";
      "cmd+equal" = "change_font_size all +2.0";
      "shift+cmd+equal" = "change_font_size all +2.0";
      "kitty_mod+minus" = "change_font_size all -2.0";
      "kitty_mod+kp_subtract" = "change_font_size all -2.0";
      "cmd+minus" = "change_font_size all -2.0";
      "shift+cmd+minus" = "change_font_size all -2.0";
      "kitty_mod+backspace" = "change_font_size all 0";
      "cmd+0" = "change_font_size all 0";

      # Hints
      "kitty_mod+e" = "open_url_with_hints";
      "kitty_mod+p>f" = "kitten hints --type path --program -";
      "kitty_mod+p>shift+f" = "kitten hints --type path --program";
      "kitty_mod+p>l" = "kitten hints --type line --program -";
      "kitty_mod+p>w" = "kitten hints --type word --program -";
      "kitty_mod+p>h" = "kitten hints --type hash --program -";
      "kitty_mod+p>n" = "kitten hints --type linenum";
      "kitty_mod+p>y" = "kitten hints --type hyperlink";

      # Fullscreen / maximized
      "kitty_mod+f11" = "toggle_fullscreen";
      "ctrl+cmd+f" = "toggle_fullscreen";
      "kitty_mod+f10" = "toggle_maximized";
      "opt+cmd+s" = "toggle_macos_secure_keyboard_entry";

      # Unicode / kittens
      "kitty_mod+u" = "kitten unicode_input";
      "ctrl+cmd+space" = "kitten unicode_input";
      "kitty_mod+f2" = "edit_config_file";
      "cmd+," = "edit_config_file";
      "kitty_mod+escape" = "kitty_shell window";

      # Opacity
      "kitty_mod+a>m" = "set_background_opacity +0.1";
      "kitty_mod+a>l" = "set_background_opacity -0.1";
      "kitty_mod+a>1" = "set_background_opacity 1";
      "kitty_mod+a>d" = "set_background_opacity default";

      # Clear terminal
      "kitty_mod+delete" = "clear_terminal reset active";
      "opt+cmd+r" = "clear_terminal reset active";
      "cmd+k" = "clear_terminal to_cursor active";

      # Config reload / debug
      "kitty_mod+f5" = "load_config_file";
      "ctrl+cmd+," = "load_config_file";
      "kitty_mod+f6" = "debug_config";
      "opt+cmd+," = "debug_config";

      # Help
      "shift+cmd+/" = "open_url https://sw.kovidgoyal.net/kitty/";

      # Send text
      "shift+space" = "send_text all \\x1b[32;2u";
      "ctrl+shift+y" = "send_text all \\x1b[89;6u";
      "ctrl+shift+h" = "send_text all \\x1b[72;6u";
      "ctrl+shift+j" = "send_text all \\x1b[74;6u";
      "ctrl+shift+k" = "send_text all \\x1b[75;6u";
      "ctrl+shift+l" = "send_text all \\x1b[76;6u";
      "ctrl+shift+n" = "send_text all \\x1b[78;6u";
      "ctrl+shift+p" = "send_text all \\x1b[80;6u";
      "ctrl+1" = "send_text all \\x14\\x31";
      "ctrl+2" = "send_text all \\x14\\x32";
      "ctrl+3" = "send_text all \\x14\\x33";
      "ctrl+4" = "send_text all \\x14\\x34";
      "ctrl+5" = "send_text all \\x14\\x35";
      "ctrl+6" = "send_text all \\x14\\x36";
      "ctrl+7" = "send_text all \\x14\\x37";
      "ctrl+8" = "send_text all \\x14\\x38";
      "ctrl+9" = "send_text all \\x14\\x39";
      "ctrl+minus" = "change_font_size all -1.0";
      "ctrl+equal" = "change_font_size all +1.0";
      "ctrl+backspace" = "send_text all \\x17";
    };

    extraConfig = ''
      mouse_map left click ungrabbed mouse_handle_click prompt
      mouse_map ctrl+left click ungrabbed mouse_handle_click link
      mouse_map shift+left click grabbed,ungrabbed mouse_handle_click selection link prompt
      mouse_map ctrl+shift+left release grabbed,ungrabbed mouse_handle_click link
      mouse_map ctrl+shift+left press grabbed discard_event
      mouse_map middle release ungrabbed paste_from_selection
      mouse_map left press ungrabbed mouse_selection normal
      mouse_map ctrl+alt+left press ungrabbed mouse_selection rectangle
      mouse_map left doublepress ungrabbed mouse_selection word
      mouse_map left triplepress ungrabbed mouse_selection line
      mouse_map ctrl+alt+left triplepress ungrabbed mouse_selection line_from_point
      mouse_map right press ungrabbed mouse_selection extend
      mouse_map shift+middle release ungrabbed,grabbed paste_selection
      mouse_map shift+middle press grabbed discard_event
      mouse_map shift+left press ungrabbed,grabbed mouse_selection normal
      mouse_map ctrl+shift+alt+left press ungrabbed,grabbed mouse_selection rectangle
      mouse_map shift+left doublepress ungrabbed,grabbed mouse_selection word
      mouse_map shift+left triplepress ungrabbed,grabbed mouse_selection line
      mouse_map ctrl+shift+alt+left triplepress ungrabbed,grabbed mouse_selection line_from_point
      mouse_map shift+right press ungrabbed,grabbed mouse_selection extend
      mouse_map ctrl+shift+right press ungrabbed mouse_show_command_output
    '';
  };

  xdg.configFile."kitty/pass_keys.py" = {
    source = ./pass_keys.py;
  };
}
