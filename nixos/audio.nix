{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    pavucontrol
    pulseaudio
    alsa-utils
  ];
  security.rtkit.enable = true;
  hardware = {
    enableAllFirmware = true;
    bluetooth = {
      enable = true;
      powerOnBoot = true;
    };
    alsa.config = ''
      amixer -c 0 sset 'Auto-Mude Mode' Disabled
    '';
  };
  services = {
    pulseaudio.enable = false;
    pipewire = {
      enable = true;
      alsa = {
        enable = true;
        support32Bit = true;
      };
      pulse.enable = true;
      jack.enable = true;
      wireplumber.extraConfig.bluetoothEnhancements = {
        "monitor.bluez.properties" = {
          "bluez5.enable-sbc-xq" = true;
          "bluez5.enable-msbc" = true;
          "bluez5.enable-hw-volume" = true;
          "bluez5.roles" = ["hsp_hs" "hsp_ag" "hfp_hf" "hfp_ag"];
        };
      };
    };
    blueman.enable = true;
  };
}
