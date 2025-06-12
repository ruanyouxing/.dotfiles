{
  services = {
    pulseaudio = {
      enable = false;
      support32Bit = true;
      extraConfig = "load-module module-combine-sink";
    };
    blueman.enable = true;
  };
}
