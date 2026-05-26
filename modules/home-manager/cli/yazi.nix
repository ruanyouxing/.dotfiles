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
      };
      # open = {
      #   rules = [
      #     {
      #       name = "*.pdf";
      #       use = "view-pdf";
      #     }
      #   ];
      # };
      mgr = {
        show_hidden = true;
        sort_by = "mtime";
        sort_reverse = true;
        sort_dir_first = false;
      };
    };
  };
}
