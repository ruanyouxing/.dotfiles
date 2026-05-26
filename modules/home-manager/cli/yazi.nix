{
  programs.yazi = {
    enable = true;
    enableZshIntegration = true;
    settings = {
      opener = {
        view-pdf = [
          {
            run = "zathura \"$@\"";
            desc = "View PDF";
          }
        ];
        edit = [
          {
            run = "$EDITOR %s";
            block = true;
          }
        ];
      };
      open = {
        rules = [
          {
            mime = "text/*";
            use = "edit";
          }
        ];
      };
      mgr = {
        show_hidden = true;
        sort_by = "mtime";
        sort_reverse = true;
        sort_dir_first = false;
      };
    };
  };
}
