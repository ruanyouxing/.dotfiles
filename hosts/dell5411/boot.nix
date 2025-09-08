{
  boot = {
    kernelParams = [
      "loglevel=3"
      "quiet"
      "splash"
      "rd.udev.log_priority=3"
      "vt.global_cursor_default=0"
    ];
    #    lanzaboote = {
    #      enable = true;
    #      pkiBundle = "/etc/secureboot";
    #    };
    # plymouth = {
    #   enable = true;
    #   theme = "bad_apple";
    #   themePackages = [ bad_apple ];
    # };
  };
  # systemd.services.plymouth-quit.serviceConfig.ExecStartPre = "${pkgs.busybox}/bin/sleep 4";
}
