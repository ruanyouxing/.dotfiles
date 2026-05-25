{pkgs, ...}: {
  programs.mpv = {
    enable = true;

    package = (
      pkgs.mpv.override {
        scripts = with pkgs.mpvScripts; [
          # uosc
          sponsorblock
          mpris
          visualizer
          thumbfast
          mpv-playlistmanager
          mpv-cheatsheet-ng
          mpv-discord
          memo
          eisa01.smartskip
          modernz
        ];

        mpv-unwrapped = pkgs.mpv-unwrapped.override {
          waylandSupport = true;
          jackaudioSupport = true;
          ffmpeg = pkgs.ffmpeg-full;
        };
      }
    );

    config = {
      profile = "high-quality";
      ytdl-format = "bestvideo+bestaudio";
      osc = false;
    };
    scriptOpts = {
      modernz = {
        seekbarfg_color = "#a78bfa";
        seekbarbg_color = "#3ddcff";
        seekbar_cache_color = "#85B0F7";
        title_color = "#e5e5e5";
        hover_effect_color = "#af8bfa";
        speed_button = true;
        fadein = true;
        fadeduration = 300;
        icon_theme = "material";
        cache_info = true;
        cache_info_speed = true;
      };
    };
  };
}
