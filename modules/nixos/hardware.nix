{ ... }: {
  hardware.bluetooth.enable = true;
  services.blueman.enable = true;

  services.power-profiles-daemon.enable = true;
  services.upower.enable = true;

  services.printing.enable = true;
  services.libinput.enable = true;
}
