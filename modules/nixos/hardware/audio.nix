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
      settings = {
        General = {
          Experimental = true;
        };
      };
    };
    alsa = {
      enablePersistence = true;
      config = ''
        amixer -c 0 sset 'Auto-Mute Mode' Disabled
      '';
    };
  };
  services = {
    pulseaudio.enable = false;
    pipewire = {
      enable = true;
      wireplumber.enable = true;
      alsa = {
        enable = true;
        support32Bit = true;
      };
      pulse.enable = true;
      jack.enable = true;
    };
    blueman.enable = true;
  };
}
