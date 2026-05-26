{...}: {
  xdg.mimeApps = {
    enable = true;
    defaultApplications = {
      "inode/directory" = "thunar.desktop";

      "image/png" = "ristretto.desktop";
      "image/jpeg" = "ristretto.desktop";
      "image/gif" = "ristretto.desktop";
      "image/webp" = "ristretto.desktop";
      "image/bmp" = "ristretto.desktop";
      "image/tiff" = "ristretto.desktop";
      "image/svg+xml" = "ristretto.desktop";
      "image/vnd.microsoft.icon" = "ristretto.desktop";
      "image/x-xcf" = "ristretto.desktop";

      "video/mp4" = "mpv.desktop";
      "video/mkv" = "mpv.desktop";
      "video/webm" = "mpv.desktop";
      "video/avi" = "mpv.desktop";
      "video/x-matroska" = "mpv.desktop";
      "video/mpeg" = "mpv.desktop";
      "video/ogg" = "mpv.desktop";
      "video/quicktime" = "mpv.desktop";

      "audio/mpeg" = "mpv.desktop";
      "audio/flac" = "mpv.desktop";
      "audio/wav" = "mpv.desktop";
      "audio/ogg" = "mpv.desktop";
      "audio/aac" = "mpv.desktop";
      "audio/opus" = "mpv.desktop";

      "application/pdf" = "org.pwmt.zathura.desktop";
      "application/epub+zip" = "org.pwmt.zathura.desktop";

      "text/plain" = "nvim.desktop";

      "x-scheme-handler/http" = "brave-browser.desktop";
      "x-scheme-handler/https" = "brave-browser.desktop";
      "x-scheme-handler/about" = "brave-browser.desktop";
      "x-scheme-handler/unknown" = "brave-browser.desktop";
      "text/html" = "brave-browser.desktop";
    };
  };
}
