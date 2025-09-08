{
  programs.btop = {
    enable = true;
    settings = {
      color_theme = "catpuccin-macchiato";
      vim_keys = true;
      update_ms = 500;
    };
    themes = {
      catpuccin-macchiato = builtins.readFile (
        builtins.fetchurl {
          url = "https://raw.githubusercontent.com/catppuccin/btop/refs/heads/main/themes/catppuccin_macchiato.theme";
          sha256 = "0l48miw3lr926fi8nzgkkhmk3jqjkba92sl0hk0ypm3v475qrcgq";
        }
      );
    };
  };
}
