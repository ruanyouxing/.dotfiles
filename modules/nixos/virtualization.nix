{
  config,
  pkgs,
  username,
  ...
}: {
  programs.virt-manager.enable = true;
  environment.etc = {
    "ovmf/edk2-x86_64-secure-code.fd" = {
      source = config.virtualisation.libvirtd.qemu.package + "/share/qemu/edk2-x86_64-secure-code.fd";
    };
    "ovmf/ovmf-code.fd" = {
      source = config.virtualisation.libvirtd.qemu.package + "/share/qemu/edk2-x86_64-code.fd";
    };
    "ovmf/edk2-i386-vars.fd" = {
      source = config.virtualisation.libvirtd.qemu.package + "/share/qemu/edk2-i386-vars.fd";
    };
  };
  virtualisation.libvirtd = {
    enable = true;
    qemu = {
      package = pkgs.qemu_kvm;
      # ovmf.enable = true;
      # ovmf.packages = [ pkgs.OVMFFull.fd ];
      swtpm.enable = true;
      runAsRoot = false;
    };
  };
  users.groups.libvirtd.members = [username];
  virtualisation.spiceUSBRedirection.enable = true;
  services.spice-vdagentd.enable = true;
  # virtualisation.vmware.guest.enable = true;
}
