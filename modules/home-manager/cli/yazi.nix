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
      };
    };
  };
}
