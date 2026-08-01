{
  programs.yazi = {
    enable = true;
    enableNushellIntegration = true;
    settings = {
      opener = {
        edit = [
          {
            run = "nvim %s";
            block = true;
          }
        ];
        view-image = [
          {
            run = "ristretto \"$@\"";
            desc = "View image";
          }
        ];
        view-video = [
          {
            run = "mpv \"$@\"";
            desc = "Play video";
          }
        ];
        play-audio = [
          {
            run = "mpv \"$@\"";
            desc = "Play audio";
          }
        ];
        view-pdf = [
          {
            run = "zathura \"$@\"";
            desc = "View PDF";
          }
        ];
        browse = [
          {
            run = "brave \"$@\"";
            desc = "Open in Brave";
          }
        ];
      };
      open = {
        rules = [
          {
            mime = "text/html";
            use = "browse";
          }
          {
            mime = "text/*";
            use = "edit";
          }
          {
            mime = "image/*";
            use = "view-image";
          }
          {
            mime = "video/*";
            use = "view-video";
          }
          {
            mime = "audio/*";
            use = "play-audio";
          }
          {
            mime = "application/pdf";
            use = "view-pdf";
          }
          {
            mime = "application/epub+zip";
            use = "view-pdf";
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
