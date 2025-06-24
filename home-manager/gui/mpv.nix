{ pkgs, ... }:
{
  programs.mpv = {
    enable = true;

    package = (
      pkgs.mpv-unwrapped.wrapper {
        scripts = with pkgs.mpvScripts; [
          uosc
          sponsorblock
          mpris
          visualizer
          thumbfast
          playlistmanager
          mpv-cheatsheet
          mpv-discord
        ];

        mpv = pkgs.mpv-unwrapped.override {
          waylandSupport = true;
          jackaudioSupport = true;
          ffmpeg = pkgs.ffmpeg-full;
        };
      }
    );

    config = {
      profile = "high-quality";
      ytdl-format = "bestvideo+bestaudio";
      cache-default = 4000000;
    };
  };
}
