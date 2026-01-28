{ ... }: {
  hardware.bluetooth.enable = true;
  services.blueman.enable = true;
  services.printing.enable = true;
  services.libinput.enable = true;
}
