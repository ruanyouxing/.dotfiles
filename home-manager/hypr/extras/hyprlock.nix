{ pkgs, ... }:
let
  whichsong = pkgs.writeShellScript "whichsong.sh" ''
    echo   $(playerctl metadata --format "{{ artist }} - {{ title }}" -p spotify)
    '';
    weather = pkgs.callPackage ../scripts/weather.nix {};
in
{
  programs.hyprlock = {
    enable = true;
    settings = {
      general = {
        hide_cursor = false;
        ignore_empty_input = true;
        immediate_render = true;
      };
      # auth = {
      #   fingerprint = {
      #     enabled = true;
      #     ready_message = "Scan fingerprint to unlock";
      #     present_message = "Scanning...";
      #     retry_delay = 250;
      #   };
      # };
      animations = {
        enabled = true;
        bezier = "linear, 1, 1, 0, 0";
        animation = [
          "fadeIn, 1, 20, linear"
          "fadeOut, 1, 8, linear"
          "inputFieldDots, 1, 2, linear"
        ];
      };
      background = {
        path = toString ../../../backgrounds/lockscreen.png;
        blur_passes = 3;
        blur_size = 8;
      };

      input-field = {
        size = "20%, 5%";
        capslock_color = "rgba(FFF176ee) rgba(F57F17ee) 90deg"; #FFF176 #F57F17
        check_color = "rgba(F1C40Fee) rgba(8E793Eee) 120deg"; #F1C40F #8E793E
        dots_size = 0.400000;
        dots_spacing = 0.300000;
        dots_text_format = "*";
        fade_on_empty = false;
        fail_color = "rgba(E74C3Cee) rgba(7B241Cee) 40deg"; #E74C3C #7B241C
        fail_text = "$PAMFAIL";
        font_color = "rgba(D0D3D4ee)"; #D0D3D4
        font_family = "JetBrainsMono Nerd Font";
        halign = "center";
        inner_color = "rgba(243646ee)"; #243646
        outer_color = "rgba(3DDCFFee) rgba(1A2C40ee) 0deg"; #3DDCFF #1A2C40
        outline_thickness = 3;
        placeholder_text = "<i>Password?</i>";
        position = "0, -31%";
        rounding = 15;
        valign = "center";
      };
      shape = [
        {
          halign = "center";
          valign = "center";
          rounding = 20;
          size = "640,440";
          zindex = 1;
          position = "0%,25%";
          color = "rgba(1E2B3A95)"; #1E2B3A
          # shadow_passes = 10
          # shadow_color= "rgba(1A2C40ee)"; #1A2C40
          border_size = 2;
          border_color = "rgba(3DDCFFee) rgba(A78BFAee) 135deg"; #3DDCFF #A78BFA
        }
        {
          halign = "center";
          valign = "center";
          position = "0%, -8%";
          zindex = 1;
          color = "rgba(1a2238bb)"; #1a2238
          size = "640,180";
          rounding = 15;
          border_size = 2;
          border_color = "rgba(3DDCFFee) rgba(A78BFAee) 135deg"; #3DDCFF #A78BFA
        }
      ];
      label = [
        {
          font_family = "StretchPro";
          font_size = 170;
          color = "rgba(3DDCFFd8)"; #3DDCFF
          halign = "center";
          valign = "center";
          text_align = "left";
          position = "-3%, 35%";
          text = "cmd[update:1000] date +'%H'";
          zindex = 2;
        }
        {
          font_family = "StretchPro";
          font_size = 170;
          color = "rgba(A78BFAd8)"; #A78BFA
          halign = "center";
          valign = "center";
          text_align = "left";
          position = "3%,15%";
          text = "cmd[update:1000] date +'%M'";
          zindex = 2;
        }
        {
          font_family = "Iosevka NFM Bold Italic";
          font_size = 80;
          color = "rgba(BFCED9aa)"; #BFCED9
          halign = "left";
          valign = "top";
          position = "1%, 0%";
          text = "cmd[update:60000] date +'%A'";
        }
        {
          font_family = "Iosevka NFM Bold Italic";
          font_size = 80;
          color = "rgba(BFCED9aa)"; #BFCED9
          halign = "left";
          valign = "top";
          position = "1%, -12%";
          text = "cmd[update:60000] date +'%d %B'";
        }

        {
          font_family = "Iosevka NFM Bold Italic";
          font_size = 120;
          color = "rgba(BFCED9aa)"; #BFCED9
          halign = "right";
          valign = "bottom";
          position = "-1%,1%";
          text = "cmd[update:60000] date +'%Y'";
        }
        {
          font_family = "Iosevka NFM Bold Italic";
          font_size = 30;
          color = "rgba(BFCED9cc)"; #BFCED9
          halign = "right";
          valign = "bottom";
          position = "0%, 0%";
          text = "cmd[update:999999] nixos-version";
        }
        {
          color = "rgba(1A2C40ee)"; #1A2C40
          font_family = "JetBrainsMono Nerd Font Italic";
          font_size = 28;
          halign = "center";
          position = "0,-22%";
          text = "Welome $USER!";
          valign = "center";
        }

        {
          color = "rgba(1A2C40ee)"; #1A2C40
          font_family = "JetBrainsMono Nerd Font";
          font_size = 18;
          halign = "center";
          position = "0, -40%";
          text = "cmd[update:1000] ${whichsong}";
          valign = "center";
        }
        {
          font_family = "JetBrainsMono Nerd Font";
          font_size = 30;
          halign = "center";
          position = "-11%, -5%";
          color = "rgba(cdd6f4ee)"; #cdd6f4
          text = "cmd[update:86400] ${weather}  --moon";
          valign = "center";
          zindex = 2;
        }
        {
          font_family = "JetBrainsMono Nerd Font";
          font_size = 24;
          halign = "center";
          position = "-11%, -9%";
          color = "rgba(3DB2FFee)"; #3DB2FF
          text = "cmd[update:86400] ${weather}  --humidity";
          valign = "center";
          zindex = 2;
        }
        {
          font_family = "JetBrainsMono Nerd Font";
          font_size = 24;
          halign = "center";
          position = "-11%, -12%";
          color = "rgba(00CC99ee)"; #00cc99
          text = "cmd[update:86400] ${weather}  --windspeed";
          valign = "center";
          zindex = 2;
        }
        {
          font_family = "Montserrat SemiBold Italic";
          font_size = 44;
          halign = "center";
          position = "-1%, -5%";
          color = "rgba(FFB74Dff)"; #FFB74D
          text_align = "right";
          text = "cmd[update:86400] ${weather} --temp";
          valign = "center";
          zindex = 2;
        }
        {
          font_family = "Montserrat SemiBold Italic";
          font_size = 44;
          halign = "center";
          position = "0%, -11%";
          color = "rgba(EF5350ff)"; #EF5350
          text = "Đắk Lắk";
          valign = "center";
          zindex = 2;
        }
        {
          font_family = "Montserrat Bold";
          font_size = 100;
          halign = "center";
          position = "11%, -8%";
          color = "rgba(9FA8DAff)"; #9FA8DA
          text = "cmd[update:60000] ${weather} --weather";
          valign = "center";
          zindex = 2;
        }
      ];
    };
  };
}
